using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace WorldRadioManager
{
    public class SongInfo
    {
        public int Index { get; set; }
        public string FolderName { get; set; }
        public string DisplayTitle { get; set; }
        public string BaseObj { get; set; }
        public string TickObj { get; set; }
        public string TagName { get; set; }
        public string RootTree { get; set; }
        public int MaxTick { get; set; }
    }

    public class MainForm : Form
    {
        private TextBox txtDatapackPath;
        private Button btnBrowseDatapack;
        private TextBox txtSongSource;
        private Button btnBrowseSong;
        private TextBox txtSongTitle;
        private Button btnImport;
        private ListView lstSongs;
        private Button btnRemove;
        private Button btnRefresh;
        private TextBox txtLog;
        private LinkLabel lblCredits;

        private string datapackRoot;

        [STAThread]
        public static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new MainForm());
        }

        public MainForm()
        {
            InitUI();
            DetectDatapack();
            RefreshSongList();
        }

        private void InitUI()
        {
            this.Text = "WorldRadio Song Manager - by Reddev";
            this.Size = new Size(780, 680);
            this.MinimumSize = new Size(680, 550);
            this.StartPosition = FormStartPosition.CenterScreen;
            this.Font = new Font("Segoe UI", 9F, FontStyle.Regular);
            this.Icon = SystemIcons.Application;

            TableLayoutPanel mainLayout = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 1,
                RowCount = 6,
                Padding = new Padding(12),
                AutoScroll = true
            };
            mainLayout.RowStyles.Add(new RowStyle(SizeType.AutoSize)); // Header
            mainLayout.RowStyles.Add(new RowStyle(SizeType.AutoSize)); // Datapack path
            mainLayout.RowStyles.Add(new RowStyle(SizeType.AutoSize)); // Import Group
            mainLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 60)); // Playlist List
            mainLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 40)); // Logs
            mainLayout.RowStyles.Add(new RowStyle(SizeType.AutoSize)); // Footer credits

            // 1. Header
            Panel headerPanel = new Panel { AutoSize = true, Dock = DockStyle.Fill, Margin = new Padding(0, 0, 0, 8) };
            Label lblTitle = new Label
            {
                Text = "📻 WorldRadio Song Manager",
                Font = new Font("Segoe UI", 14F, FontStyle.Bold),
                ForeColor = Color.FromArgb(20, 110, 45),
                AutoSize = true,
                Location = new Point(0, 0)
            };
            Label lblSubtitle = new Label
            {
                Text = "Easily import, update, and manage NoteBlockStudio songs for your Animated Java Boombox radio.",
                Font = new Font("Segoe UI", 9F, FontStyle.Regular),
                ForeColor = Color.Gray,
                AutoSize = true,
                Location = new Point(2, 28)
            };
            headerPanel.Controls.Add(lblTitle);
            headerPanel.Controls.Add(lblSubtitle);
            mainLayout.Controls.Add(headerPanel, 0, 0);

            // 2. Datapack Path Group
            GroupBox grpPath = new GroupBox
            {
                Text = "Datapack Location",
                Dock = DockStyle.Fill,
                AutoSize = true,
                Margin = new Padding(0, 0, 0, 8),
                Padding = new Padding(10)
            };
            TableLayoutPanel pathLayout = new TableLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                ColumnCount = 2
            };
            pathLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
            pathLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));

            txtDatapackPath = new TextBox { Dock = DockStyle.Fill, ReadOnly = true };
            btnBrowseDatapack = new Button { Text = "Browse...", AutoSize = true, Margin = new Padding(6, 0, 0, 0) };
            btnBrowseDatapack.Click += (s, e) => BrowseDatapack();

            pathLayout.Controls.Add(txtDatapackPath, 0, 0);
            pathLayout.Controls.Add(btnBrowseDatapack, 1, 0);
            grpPath.Controls.Add(pathLayout);
            mainLayout.Controls.Add(grpPath, 0, 1);

            // 3. Import Song Group
            GroupBox grpImport = new GroupBox
            {
                Text = "Import NoteBlockStudio Song (ZIP or Folder)",
                Dock = DockStyle.Fill,
                AutoSize = true,
                Margin = new Padding(0, 0, 0, 8),
                Padding = new Padding(10)
            };
            TableLayoutPanel importLayout = new TableLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                ColumnCount = 3,
                RowCount = 2
            };
            importLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));
            importLayout.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100));
            importLayout.ColumnStyles.Add(new ColumnStyle(SizeType.AutoSize));

            Label lblSongSrc = new Label { Text = "Source File / Folder:", AutoSize = true, Anchor = AnchorStyles.Left };
            txtSongSource = new TextBox { Dock = DockStyle.Fill, Margin = new Padding(6, 4, 6, 4) };
            btnBrowseSong = new Button { Text = "Browse File...", AutoSize = true, Margin = new Padding(0, 4, 0, 4) };
            btnBrowseSong.Click += (s, e) => BrowseSongFile();

            Label lblSongName = new Label { Text = "Display Title:", AutoSize = true, Anchor = AnchorStyles.Left };
            txtSongTitle = new TextBox { Dock = DockStyle.Fill, Margin = new Padding(6, 4, 6, 4) };
            btnImport = new Button
            {
                Text = "➕ Import Song",
                Font = new Font("Segoe UI", 9F, FontStyle.Bold),
                BackColor = Color.FromArgb(40, 150, 60),
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat,
                AutoSize = true,
                Margin = new Padding(0, 4, 0, 4)
            };
            btnImport.FlatAppearance.BorderSize = 0;
            btnImport.Click += (s, e) => ImportSong();

            importLayout.Controls.Add(lblSongSrc, 0, 0);
            importLayout.Controls.Add(txtSongSource, 1, 0);
            importLayout.Controls.Add(btnBrowseSong, 2, 0);

            importLayout.Controls.Add(lblSongName, 0, 1);
            importLayout.Controls.Add(txtSongTitle, 1, 1);
            importLayout.Controls.Add(btnImport, 2, 1);

            grpImport.Controls.Add(importLayout);
            mainLayout.Controls.Add(grpImport, 0, 2);

            // 4. Playlist Group
            GroupBox grpPlaylist = new GroupBox
            {
                Text = "Installed Playlist",
                Dock = DockStyle.Fill,
                Margin = new Padding(0, 0, 0, 8),
                Padding = new Padding(10)
            };
            TableLayoutPanel listLayout = new TableLayoutPanel
            {
                Dock = DockStyle.Fill,
                ColumnCount = 1,
                RowCount = 2
            };
            listLayout.RowStyles.Add(new RowStyle(SizeType.Percent, 100));
            listLayout.RowStyles.Add(new RowStyle(SizeType.AutoSize));

            lstSongs = new ListView
            {
                Dock = DockStyle.Fill,
                View = View.Details,
                FullRowSelect = true,
                GridLines = true,
                MultiSelect = false
            };
            lstSongs.Columns.Add("#", 40, HorizontalAlignment.Center);
            lstSongs.Columns.Add("Title", 220, HorizontalAlignment.Left);
            lstSongs.Columns.Add("Folder ID", 150, HorizontalAlignment.Left);
            lstSongs.Columns.Add("Duration", 100, HorizontalAlignment.Right);
            lstSongs.Columns.Add("Scoreboard Objective", 180, HorizontalAlignment.Left);

            FlowLayoutPanel btnPanel = new FlowLayoutPanel
            {
                Dock = DockStyle.Top,
                AutoSize = true,
                FlowDirection = FlowDirection.RightToLeft,
                Margin = new Padding(0, 6, 0, 0)
            };
            btnRemove = new Button
            {
                Text = "🗑️ Remove Selected Song",
                AutoSize = true,
                BackColor = Color.FromArgb(200, 50, 50),
                ForeColor = Color.White,
                FlatStyle = FlatStyle.Flat
            };
            btnRemove.FlatAppearance.BorderSize = 0;
            btnRemove.Click += (s, e) => RemoveSelectedSong();

            btnRefresh = new Button
            {
                Text = "🔄 Refresh List",
                AutoSize = true
            };
            btnRefresh.Click += (s, e) => RefreshSongList();

            btnPanel.Controls.Add(btnRemove);
            btnPanel.Controls.Add(btnRefresh);

            listLayout.Controls.Add(lstSongs, 0, 0);
            listLayout.Controls.Add(btnPanel, 0, 1);
            grpPlaylist.Controls.Add(listLayout);
            mainLayout.Controls.Add(grpPlaylist, 0, 3);

            // 5. Activity Log
            GroupBox grpLog = new GroupBox
            {
                Text = "Activity Log",
                Dock = DockStyle.Fill,
                Margin = new Padding(0, 0, 0, 8),
                Padding = new Padding(8)
            };
            txtLog = new TextBox
            {
                Dock = DockStyle.Fill,
                Multiline = true,
                ReadOnly = true,
                ScrollBars = ScrollBars.Vertical,
                BackColor = Color.FromArgb(245, 245, 245),
                Font = new Font("Consolas", 8.5F)
            };
            grpLog.Controls.Add(txtLog);
            mainLayout.Controls.Add(grpLog, 0, 4);

            // 6. Footer Credits
            Panel footerPanel = new Panel { Dock = DockStyle.Fill, AutoSize = true };
            lblCredits = new LinkLabel
            {
                Text = "Created by Reddev  •  https://reddev.dev",
                AutoSize = true,
                Dock = DockStyle.Right,
                Font = new Font("Segoe UI", 9F, FontStyle.Regular),
                LinkColor = Color.FromArgb(20, 110, 45)
            };
            lblCredits.LinkClicked += (s, e) =>
            {
                try { Process.Start("https://reddev.dev"); } catch { }
            };
            footerPanel.Controls.Add(lblCredits);
            mainLayout.Controls.Add(footerPanel, 0, 5);

            this.Controls.Add(mainLayout);
        }

        private void Log(string message)
        {
            txtLog.AppendText(string.Format("[{0}] {1}\r\n", DateTime.Now.ToString("HH:mm:ss"), message));
        }

        private void DetectDatapack()
        {
            string current = AppDomain.CurrentDomain.BaseDirectory.TrimEnd('\\', '/');
            string[] checkCandidates = new string[]
            {
                current,
                Path.Combine(current, "worldradio datapack"),
                Path.Combine(current, "..", "worldradio datapack"),
                @"C:\Users\devus\Desktop\World Radio\worldradio datapack",
                @"C:\Users\devus\Desktop\test\worldradio datapack"
            };

            foreach (string cand in checkCandidates)
            {
                string full = Path.GetFullPath(cand);
                if (Directory.Exists(full) && Directory.Exists(Path.Combine(full, "data", "worldradio")))
                {
                    datapackRoot = full;
                    txtDatapackPath.Text = datapackRoot;
                    Log("Found WorldRadio Datapack at: " + datapackRoot);
                    return;
                }
            }

            Log("Datapack folder not automatically detected. Please browse for 'worldradio datapack'.");
        }

        private void BrowseDatapack()
        {
            using (FolderBrowserDialog fbd = new FolderBrowserDialog())
            {
                fbd.Description = "Select the 'worldradio datapack' folder:";
                if (fbd.ShowDialog() == DialogResult.OK)
                {
                    string selected = fbd.SelectedPath;
                    if (Directory.Exists(Path.Combine(selected, "data", "worldradio")))
                    {
                        datapackRoot = selected;
                        txtDatapackPath.Text = datapackRoot;
                        Log("Datapack path set to: " + datapackRoot);
                        RefreshSongList();
                    }
                    else
                    {
                        MessageBox.Show("Selected folder does not contain 'data/worldradio'. Please select the root 'worldradio datapack' directory.", "Invalid Directory", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
        }

        private void BrowseSongFile()
        {
            using (OpenFileDialog ofd = new OpenFileDialog())
            {
                ofd.Filter = "NoteBlockStudio Exports (*.zip)|*.zip|All Files (*.*)|*.*";
                ofd.Title = "Select Exported NoteBlockStudio ZIP";
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    txtSongSource.Text = ofd.FileName;
                    string nameNoExt = Path.GetFileNameWithoutExtension(ofd.FileName);
                    string formatted = Regex.Replace(nameNoExt.Replace('_', ' '), @"\b[a-z]", m => m.Value.ToUpper());
                    txtSongTitle.Text = formatted;
                }
            }
        }

        private void RefreshSongList()
        {
            lstSongs.Items.Clear();
            if (string.IsNullOrEmpty(datapackRoot) || !Directory.Exists(datapackRoot)) return;

            var songs = GetInstalledSongs();
            foreach (var song in songs)
            {
                double seconds = song.MaxTick / 20.0;
                string durationStr = string.Format("{0:0.0}s ({1}t)", seconds, song.MaxTick);

                ListViewItem item = new ListViewItem(song.Index.ToString());
                item.SubItems.Add(song.DisplayTitle);
                item.SubItems.Add(song.FolderName);
                item.SubItems.Add(durationStr);
                item.SubItems.Add(song.TickObj);
                item.Tag = song;
                lstSongs.Items.Add(item);
            }

            Log(string.Format("Loaded {0} song(s) from playlist.", songs.Count));
        }

        private List<SongInfo> GetInstalledSongs()
        {
            List<SongInfo> list = new List<SongInfo>();
            if (string.IsNullOrEmpty(datapackRoot)) return list;

            string songsDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs");
            if (!Directory.Exists(songsDir)) return list;

            var dirs = Directory.GetDirectories(songsDir);
            int idx = 1;
            foreach (var dir in dirs.OrderBy(d => Path.GetFileName(d)))
            {
                string folder = Path.GetFileName(dir);
                if (folder.Equals("TEMPLATE", StringComparison.OrdinalIgnoreCase)) continue;

                string title = null;
                string titleFile = Path.Combine(dir, "title.txt");
                if (File.Exists(titleFile))
                {
                    title = File.ReadAllText(titleFile).Trim();
                }

                if (string.IsNullOrEmpty(title))
                {
                    title = Regex.Replace(folder.Replace('_', ' '), @"\b[a-z]", m => m.Value.ToUpper());
                }

                string baseObj, tickObj, tag, rootTree;
                DetectSongDetails(folder, out baseObj, out tickObj, out tag, out rootTree);
                int maxT = DetectMaxTick(folder);

                list.Add(new SongInfo
                {
                    Index = idx,
                    FolderName = folder,
                    DisplayTitle = title,
                    BaseObj = baseObj,
                    TickObj = tickObj,
                    TagName = tag,
                    RootTree = rootTree,
                    MaxTick = maxT
                });
                idx++;
            }

            return list;
        }

        private void DetectSongDetails(string folderName, out string baseObj, out string tickObj, out string tag, out string rootTree)
        {
            baseObj = "nbs_" + folderName;
            tickObj = "nbs_" + folderName + "_t";
            tag = "nbs_" + folderName;
            rootTree = "0_2047";

            string songDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", folderName);
            string loadFile = Path.Combine(songDir, "load.mcfunction");
            if (File.Exists(loadFile))
            {
                string loadText = File.ReadAllText(loadFile);
                var matches = Regex.Matches(loadText, @"scoreboard\s+objectives\s+add\s+(\S+)\s+dummy");
                if (matches.Count >= 2)
                {
                    baseObj = matches[0].Groups[1].Value;
                    tickObj = matches[1].Groups[1].Value;
                }
                else if (matches.Count == 1)
                {
                    baseObj = matches[0].Groups[1].Value;
                    tickObj = baseObj + "_t";
                }
            }

            string playFile = Path.Combine(songDir, "play.mcfunction");
            if (File.Exists(playFile))
            {
                string playText = File.ReadAllText(playFile);
                Match m = Regex.Match(playText, @"tag\s+@s\s+add\s+(\S+)");
                if (m.Success) tag = m.Groups[1].Value;
            }
            else
            {
                tag = baseObj;
            }

            string tickFile = Path.Combine(songDir, "tick.mcfunction");
            if (File.Exists(tickFile))
            {
                string tickText = File.ReadAllText(tickFile);
                Match m = Regex.Match(tickText, @"tree/(\S+)");
                if (m.Success) rootTree = m.Groups[1].Value;
            }
        }

        private int DetectMaxTick(string folderName)
        {
            string notesDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", folderName, "notes");
            if (Directory.Exists(notesDir))
            {
                var files = Directory.GetFiles(notesDir, "*.mcfunction");
                int max = 0;
                foreach (var f in files)
                {
                    string stem = Path.GetFileNameWithoutExtension(f);
                    int val;
                    if (int.TryParse(stem, out val))
                    {
                        if (val > max) max = val;
                    }
                }
                return max;
            }
            return 0;
        }

        private void ImportSong()
        {
            string source = txtSongSource.Text.Trim();
            string title = txtSongTitle.Text.Trim();

            if (string.IsNullOrEmpty(datapackRoot) || !Directory.Exists(datapackRoot))
            {
                MessageBox.Show("Please select a valid 'worldradio datapack' folder first.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrEmpty(source) || (!File.Exists(source) && !Directory.Exists(source)))
            {
                MessageBox.Show("Please select a valid song source file (.zip) or folder.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (string.IsNullOrEmpty(title))
            {
                title = Path.GetFileNameWithoutExtension(source);
            }

            Log("Starting import for: " + title);

            try
            {
                string tempDir = Path.Combine(Path.GetTempPath(), "worldradio_import_" + Guid.NewGuid().ToString("N"));
                Directory.CreateDirectory(tempDir);

                if (File.Exists(source) && source.EndsWith(".zip", StringComparison.OrdinalIgnoreCase))
                {
                    ZipFile.ExtractToDirectory(source, tempDir);
                }
                else if (Directory.Exists(source))
                {
                    CopyDirectory(source, tempDir);
                }

                string foundSongDir = null;
                string songFolderName = null;

                foreach (string dir in Directory.GetDirectories(tempDir, "*", SearchOption.AllDirectories))
                {
                    if (File.Exists(Path.Combine(dir, "load.mcfunction")) && Directory.Exists(Path.Combine(dir, "notes")))
                    {
                        foundSongDir = dir;
                        songFolderName = Path.GetFileName(dir);
                        break;
                    }
                }

                if (foundSongDir == null)
                {
                    Directory.Delete(tempDir, true);
                    MessageBox.Show("Could not locate a valid NoteBlockStudio song directory (missing load.mcfunction or notes/ folder).", "Import Failed", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                string destDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", songFolderName);
                if (Directory.Exists(destDir)) Directory.Delete(destDir, true);
                CopyDirectory(foundSongDir, destDir);
                Directory.Delete(tempDir, true);

                File.WriteAllText(Path.Combine(destDir, "title.txt"), title);
                Log("Copied song files to: data/worldradio/function/songs/" + songFolderName);

                // Sanitize all .mcfunction files in the song directory recursively
                int sanitizedCount = 0;
                foreach (string file in Directory.GetFiles(destDir, "*.mcfunction", SearchOption.AllDirectories))
                {
                    string content = File.ReadAllText(file);
                    bool changed = false;
                    if (content.Contains("minecraft:Fizz"))
                    {
                        content = content.Replace("minecraft:Fizz", "minecraft:block.fire.extinguish");
                        changed = true;
                    }
                    if (Regex.IsMatch(content, @"playsound\s+minecraft:(\S+)", RegexOptions.IgnoreCase))
                    {
                        string newC = Regex.Replace(content, @"playsound\s+minecraft:(\S+)", m => "playsound minecraft:" + m.Groups[1].Value.ToLower(), RegexOptions.IgnoreCase);
                        if (newC != content)
                        {
                            content = newC;
                            changed = true;
                        }
                    }
                    if (changed)
                    {
                        File.WriteAllText(file, content);
                        sanitizedCount++;
                    }
                }
                if (sanitizedCount > 0)
                {
                    Log(string.Format("Sanitized {0} function file(s) with invalid playsounds.", sanitizedCount));
                }

                // Detect details
                string baseObj, tickObj, tag, rootTree;
                DetectSongDetails(songFolderName, out baseObj, out tickObj, out tag, out rootTree);

                // Create connector functions
                string radioSongDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", songFolderName);
                if (!Directory.Exists(radioSongDir)) Directory.CreateDirectory(radioSongDir);

                // 1. play.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "play.mcfunction"),
                    string.Format("# Song: {0} - Play\ntag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] add {1}\nscoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] {2} 0\nscoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] {3} -1\n\nscoreboard players set #radio {2} 0\nscoreboard players set #radio {3} -1\nscoreboard players set #radio_has_song worldradio.data 1\n",
                    title, tag, baseObj, tickObj));

                // 2. pause.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "pause.mcfunction"),
                    string.Format("# Song: {0} - Pause\ntag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove {1}\nscoreboard players set #radio_has_song worldradio.data 0\n",
                    title, tag));

                // 3. resume.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "resume.mcfunction"),
                    string.Format("# Song: {0} - Resume\ntag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] add {1}\nscoreboard players set #radio_has_song worldradio.data 1\n",
                    title, tag));

                // 4. stop.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "stop.mcfunction"),
                    string.Format("# Song: {0} - Stop\ntag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove {1}\nscoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] {2}\nscoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] {3}\n\nscoreboard players reset #radio {2}\nscoreboard players reset #radio {3}\nscoreboard players set #radio_has_song worldradio.data 0\n",
                    title, tag, baseObj, tickObj));

                // 5. tick.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "tick.mcfunction"),
                    string.Format("# Song: {0} - Tick\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag={1}] run scoreboard players operation @s {2} += speed {2}\nscoreboard players operation #radio {2} += speed {2}\n\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag={1}] at @s run function worldradio:songs/{3}/tree/{4}\n\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag={1},limit=1] run scoreboard players operation #radio {3} = @s {3}\n\nexecute store result score #has_tag worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag={1},limit=1]\nexecute if score #has_tag worldradio.data matches 0 run scoreboard players set #radio_has_song worldradio.data 0\n",
                    title, tag, baseObj, tickObj, rootTree));

                // 6. seek.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "seek.mcfunction"),
                    string.Format("# Song: {0} - Seek\nscoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data\nscoreboard players operation #seek_delta worldradio.data *= speed {1}\nscoreboard players operation #radio {1} += #seek_delta worldradio.data\n\nexecute if score #radio {1} matches ..-1 run scoreboard players set #radio {1} 0\nexecute if score #radio {1} matches 0 run scoreboard players set #radio {2} -1\n\nexecute if score #radio {1} matches 1.. run scoreboard players operation #temp worldradio.data = #radio {1}\nexecute if score #radio {1} matches 1.. run scoreboard players operation #temp worldradio.data /= speed {1}\nexecute if score #radio {1} matches 1.. run scoreboard players remove #temp worldradio.data 1\nexecute if score #radio {1} matches 1.. run scoreboard players operation #radio {2} = #temp worldradio.data\n\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s {1} = #radio {1}\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s {2} = #radio {2}\n",
                    title, baseObj, tickObj));

                // 7. update_display.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "update_display.mcfunction"),
                    string.Format("# Song: {0} - Update Boombox Display\nexecute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value {{text:\"\",extra:[{{text:\"Playing: \",color:\"green\"}},{{text:\"{0}\",color:\"dark_green\"}}]}}\n", title));

                Log("Generated connector functions in: data/worldradio/function/radio/songs/" + songFolderName);

                var allSongs = GetInstalledSongs();
                RebuildPlaylistDispatchers(allSongs);
                RefreshSongList();

                txtSongSource.Clear();
                txtSongTitle.Clear();

                MessageBox.Show(string.Format("Successfully imported '{0}'!\nRun /reload in Minecraft to play.", title), "Import Complete", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                Log("ERROR during import: " + ex.Message);
                MessageBox.Show("Import failed: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void RemoveSelectedSong()
        {
            if (lstSongs.SelectedItems.Count == 0)
            {
                MessageBox.Show("Please select a song from the playlist to remove.", "Selection Required", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var song = (SongInfo)lstSongs.SelectedItems[0].Tag;
            var confirm = MessageBox.Show(string.Format("Are you sure you want to remove '{0}' (#{1}) from the playlist?", song.DisplayTitle, song.Index), "Confirm Removal", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (confirm != DialogResult.Yes) return;

            try
            {
                Log("Removing song: " + song.DisplayTitle);

                string radioSongDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", song.FolderName);
                if (Directory.Exists(radioSongDir)) Directory.Delete(radioSongDir, true);

                string mainSongDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", song.FolderName);
                if (Directory.Exists(mainSongDir)) Directory.Delete(mainSongDir, true);

                var remaining = GetInstalledSongs();
                RebuildPlaylistDispatchers(remaining);
                RefreshSongList();

                Log(string.Format("Successfully removed '{0}'. Playlist re-indexed.", song.DisplayTitle));
                MessageBox.Show(string.Format("Removed '{0}'. Run /reload in Minecraft.", song.DisplayTitle), "Song Removed", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                Log("ERROR removing song: " + ex.Message);
                MessageBox.Show("Failed to remove song: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        public void RebuildPlaylistDispatchers(List<SongInfo> songs)
        {
            string radioSongsDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs");
            if (!Directory.Exists(radioSongsDir)) Directory.CreateDirectory(radioSongsDir);

            // 1. play_song.mcfunction
            var playLines = new List<string> { "# WorldRadio - Global Play Song Dispatcher" };
            foreach (var s in songs)
            {
                playLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/play", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "play_song.mcfunction"), playLines);

            // 2. pause_song.mcfunction
            var pauseLines = new List<string> { "# WorldRadio - Global Pause Song Dispatcher" };
            foreach (var s in songs)
            {
                pauseLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/pause", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "pause_song.mcfunction"), pauseLines);

            // 3. resume_song.mcfunction
            var resumeLines = new List<string> { "# WorldRadio - Global Resume Song Dispatcher" };
            foreach (var s in songs)
            {
                resumeLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/resume", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "resume_song.mcfunction"), resumeLines);

            // 4. stop_song.mcfunction
            var stopLines = new List<string> { "# WorldRadio - Global Stop Song Dispatcher" };
            foreach (var s in songs)
            {
                stopLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/stop", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "stop_song.mcfunction"), stopLines);

            // 5. tick_song.mcfunction
            var tickLines = new List<string> { "# WorldRadio - Global Tick Song Dispatcher" };
            foreach (var s in songs)
            {
                tickLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/tick", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "tick_song.mcfunction"), tickLines);

            // 6. seek_song.mcfunction
            var seekLines = new List<string> { "# WorldRadio - Global Seek Song Dispatcher" };
            foreach (var s in songs)
            {
                seekLines.Add(string.Format("execute if score #song worldradio.data matches {0} run function worldradio:radio/songs/{1}/seek", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "seek_song.mcfunction"), seekLines);

            // 7. check_finished.mcfunction
            var finishLines = new List<string> { "# WorldRadio - Global Song Finish Check" };
            foreach (var s in songs)
            {
                finishLines.Add(string.Format("execute if score #song worldradio.data matches {0} as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,limit=1] if score @s {1} matches {2}.. run function worldradio:radio/internal/on_song_finished", s.Index, s.TickObj, s.MaxTick));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "check_finished.mcfunction"), finishLines);

            // 8. announce_song.mcfunction
            var announceLines = new List<string>
            {
                "# WorldRadio - Announce Song Actionbar & Chat",
                "# Actionbar (0 = Both, 1 = Actionbar Only)"
            };
            foreach (var s in songs)
            {
                announceLines.Add(string.Format("execute if score #announce_mode worldradio.data matches 0..1 if score #song worldradio.data matches {0} run title @a actionbar [\"\",{{\"text\":\"Now Playing: \",\"color\":\"gray\"}},{{\"text\":\"{1}\",\"color\":\"aqua\",\"bold\":true}}]", s.Index, s.DisplayTitle));
            }
            announceLines.Add("");
            announceLines.Add("# Chat Notification (0 = Both, 2 = Chat Only)");
            foreach (var s in songs)
            {
                announceLines.Add(string.Format("execute if score #announce_mode worldradio.data matches 0 if score #song worldradio.data matches {0} run tellraw @a [{{\"text\":\"[WorldRadio] \",\"color\":\"green\",\"bold\":true}},{{\"text\":\"Now Playing: \",\"color\":\"gray\"}},{{\"text\":\"{1}\",\"color\":\"dark_green\",\"bold\":true}}]", s.Index, s.DisplayTitle));
                announceLines.Add(string.Format("execute if score #announce_mode worldradio.data matches 2 if score #song worldradio.data matches {0} run tellraw @a [{{\"text\":\"[WorldRadio] \",\"color\":\"green\",\"bold\":true}},{{\"text\":\"Now Playing: \",\"color\":\"gray\"}},{{\"text\":\"{1}\",\"color\":\"dark_green\",\"bold\":true}}]", s.Index, s.DisplayTitle));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "announce_song.mcfunction"), announceLines);

            // 9. update_display.mcfunction
            var displayLines = new List<string> { "# WorldRadio - Update Boombox Text Display" };
            foreach (var s in songs)
            {
                displayLines.Add(string.Format("execute if score #song worldradio.data matches {0} as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value {{text:\"\",extra:[{{text:\"Playing: \",color:\"green\"}},{{text:\"{1}\",color:\"dark_green\"}}]}}", s.Index, s.DisplayTitle));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "update_display.mcfunction"), displayLines);

            // 10. load_songs.mcfunction
            var loadLines = new List<string> { "# WorldRadio - Load All Song Objectives" };
            foreach (var s in songs)
            {
                loadLines.Add(string.Format("function worldradio:songs/{0}/load", s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "load_songs.mcfunction"), loadLines);

            // 11. registry.mcfunction
            var regLines = new List<string>
            {
                "# WorldRadio - Song Registry",
                string.Format("scoreboard players set #total_songs worldradio.data {0}", songs.Count),
                ""
            };
            foreach (var s in songs)
            {
                regLines.Add(string.Format("function worldradio:songs/{0}/load", s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "registry.mcfunction"), regLines);

            // 12. status.mcfunction
            var statusLines = new List<string>
            {
                "# WorldRadio - Print Status Summary",
                "execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{\"text\":\"[WorldRadio] \",\"color\":\"red\",\"bold\":true},{\"text\":\"You need the \",\"color\":\"gray\"},{\"text\":\"WorldRadioDJ\",\"color\":\"gold\",\"bold\":true},{\"text\":\" tag to use this command.\",\"color\":\"gray\"}]",
                "execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0",
                "",
                "execute store result score #boombox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root]",
                "",
                "tellraw @a [\"\\n\",{\"text\":\"======== \",\"color\":\"dark_green\"},{\"text\":\"WorldRadio Status\",\"color\":\"green\",\"bold\":true},{\"text\":\" ========\",\"color\":\"dark_green\"}]",
                ""
            };
            foreach (var s in songs)
            {
                statusLines.Add(string.Format("execute if score #song worldradio.data matches {0} run tellraw @a [{{\"text\":\" Current Song: \",\"color\":\"gray\"}},{{\"text\":\"{1}\",\"color\":\"gold\",\"bold\":true}},{{\"text\":\" ({0}/\",\"color\":\"dark_gray\"}},{{\"score\":{{\"name\":\"#total_songs\",\"objective\":\"worldradio.data\"}},\"color\":\"dark_gray\"}},{{\"text\":\")\",\"color\":\"dark_gray\"}}]", s.Index, s.DisplayTitle));
            }
            statusLines.AddRange(new string[]
            {
                "",
                "# State info",
                "execute if score #state worldradio.data matches 0 run tellraw @a [{\"text\":\" Playback State: \",\"color\":\"gray\"},{\"text\":\"STOPPED\",\"color\":\"red\",\"bold\":true}]",
                "execute if score #state worldradio.data matches 1 run tellraw @a [{\"text\":\" Playback State: \",\"color\":\"gray\"},{\"text\":\"PLAYING\",\"color\":\"green\",\"bold\":true}]",
                "execute if score #state worldradio.data matches 2 run tellraw @a [{\"text\":\" Playback State: \",\"color\":\"gray\"},{\"text\":\"PAUSED\",\"color\":\"yellow\",\"bold\":true}]",
                "",
                "# Shuffle mode info",
                "execute if score #shuffle worldradio.data matches 0 run tellraw @a [{\"text\":\" Playlist Mode: \",\"color\":\"gray\"},{\"text\":\"Sequential\",\"color\":\"aqua\",\"bold\":true}]",
                "execute if score #shuffle worldradio.data matches 1 run tellraw @a [{\"text\":\" Playlist Mode: \",\"color\":\"gray\"},{\"text\":\"Shuffle\",\"color\":\"gold\",\"bold\":true}]",
                "",
                "# Notification mode info",
                "execute if score #announce_mode worldradio.data matches 0 run tellraw @a [{\"text\":\" Notifications: \",\"color\":\"gray\"},{\"text\":\"Both (Actionbar & Chat)\",\"color\":\"aqua\",\"bold\":true}]",
                "execute if score #announce_mode worldradio.data matches 1 run tellraw @a [{\"text\":\" Notifications: \",\"color\":\"gray\"},{\"text\":\"Actionbar Only\",\"color\":\"gold\",\"bold\":true}]",
                "execute if score #announce_mode worldradio.data matches 2 run tellraw @a [{\"text\":\" Notifications: \",\"color\":\"gray\"},{\"text\":\"Chat Only\",\"color\":\"yellow\",\"bold\":true}]",
                "execute if score #announce_mode worldradio.data matches 3 run tellraw @a [{\"text\":\" Notifications: \",\"color\":\"gray\"},{\"text\":\"None (Silent)\",\"color\":\"red\",\"bold\":true}]",
                "",
                "# Boombox counts",
                "tellraw @a [{\"text\":\" Active Boomboxes: \",\"color\":\"gray\"},{\"score\":{{\"name\":\"#boombox_count\",\"objective\":\"worldradio.data\"}},\"color\":\"light_purple\",\"bold\":true}]",
                "tellraw @a [{\"text\":\"=================================\",\"color\":\"dark_green\"},\"\\n\"]"
            });
            File.WriteAllLines(Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "status.mcfunction"), statusLines);

            Log(string.Format("Rebuilt all playlist dispatchers for {0} song(s).", songs.Count));
        }

        private static void CopyDirectory(string sourceDir, string targetDir)
        {
            Directory.CreateDirectory(targetDir);
            foreach (string file in Directory.GetFiles(sourceDir))
            {
                File.Copy(file, Path.Combine(targetDir, Path.GetFileName(file)), true);
            }
            foreach (string directory in Directory.GetDirectories(sourceDir))
            {
                CopyDirectory(directory, Path.Combine(targetDir, Path.GetFileName(directory)));
            }
        }
    }
}

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
        public string ScoreboardObj { get; set; }
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

            // Main Layout Table
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
                    // Format default title (e.g. steam_gardens -> Steam Gardens)
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
                item.SubItems.Add(song.ScoreboardObj);
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

            string announceFile = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", "announce_song.mcfunction");
            Dictionary<int, string> titleMap = new Dictionary<int, string>();

            if (File.Exists(announceFile))
            {
                string[] lines = File.ReadAllLines(announceFile);
                foreach (string line in lines)
                {
                    Match m = Regex.Match(line, @"matches\s+(\d+)\s+run\s+title\s+@a\s+actionbar\s+\[.*?Now Playing:\s*\\*""?(.*?)\\*""?\]", RegexOptions.IgnoreCase);
                    if (!m.Success)
                    {
                        m = Regex.Match(line, @"matches\s+(\d+)\s+run\s+title\s+@a\s+actionbar\s+.*?""text"":""([^""]+)""", RegexOptions.IgnoreCase);
                    }
                    if (m.Success)
                    {
                        int idx = int.Parse(m.Groups[1].Value);
                        string t = m.Groups[2].Value.Replace("Now Playing: ", "").Trim();
                        titleMap[idx] = t;
                    }
                }
            }

            string playSongFile = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", "play_song.mcfunction");
            if (File.Exists(playSongFile))
            {
                string[] lines = File.ReadAllLines(playSongFile);
                foreach (string line in lines)
                {
                    Match m = Regex.Match(line, @"matches\s+(\d+)\s+run\s+function\s+worldradio:radio/songs/([^/\s]+)/play");
                    if (m.Success)
                    {
                        int idx = int.Parse(m.Groups[1].Value);
                        string folder = m.Groups[2].Value;

                        string display = titleMap.ContainsKey(idx) ? titleMap[idx] : folder;

                        // Detect objective and max tick
                        string obj = DetectObjective(folder);
                        int maxT = DetectMaxTick(folder);

                        list.Add(new SongInfo
                        {
                            Index = idx,
                            FolderName = folder,
                            DisplayTitle = display,
                            ScoreboardObj = obj,
                            MaxTick = maxT
                        });
                    }
                }
            }

            // Sort by index
            return list.OrderBy(s => s.Index).ToList();
        }

        private string DetectObjective(string folderName)
        {
            string loadFile = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", folderName, "load.mcfunction");
            if (File.Exists(loadFile))
            {
                string content = File.ReadAllText(loadFile);
                Match m = Regex.Match(content, @"scoreboard\s+objectives\s+add\s+(\S+)\s+dummy");
                if (m.Success) return m.Groups[1].Value;
            }
            return "nbs_" + folderName + "_t";
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

                // Find song folder containing load.mcfunction and notes/
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

                // Destination in datapack
                string destDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "songs", songFolderName);
                if (Directory.Exists(destDir)) Directory.Delete(destDir, true);
                CopyDirectory(foundSongDir, destDir);
                Directory.Delete(tempDir, true);

                Log("Copied song files to: data/worldradio/function/songs/" + songFolderName);

                // Sanitize notes (lowercase sound IDs and fix minecraft:Fizz)
                string notesDir = Path.Combine(destDir, "notes");
                if (Directory.Exists(notesDir))
                {
                    int sanitizedCount = 0;
                    foreach (string file in Directory.GetFiles(notesDir, "*.mcfunction"))
                    {
                        string content = File.ReadAllText(file);
                        if (Regex.IsMatch(content, @"minecraft:[^ ]*[A-Z]"))
                        {
                            content = content.Replace("minecraft:Fizz", "minecraft:block.fire.extinguish");
                            content = Regex.Replace(content, @"playsound\s+minecraft:(\S+)", m => "playsound minecraft:" + m.Groups[1].Value.ToLower());
                            File.WriteAllText(file, content);
                            sanitizedCount++;
                        }
                    }
                    if (sanitizedCount > 0)
                    {
                        Log(string.Format("Sanitized {0} note file(s) with invalid uppercase sound IDs.", sanitizedCount));
                    }
                }

                // Get scoreboard objective & max tick
                string obj = DetectObjective(songFolderName);
                int maxTick = DetectMaxTick(songFolderName);

                // Create connector functions
                string radioSongDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", songFolderName);
                if (!Directory.Exists(radioSongDir)) Directory.CreateDirectory(radioSongDir);

                // play.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "play.mcfunction"),
                    string.Format("# Start playback for {0}\nscoreboard players set #song_id worldradio.data 0\nscoreboard players set #state worldradio.data 1\nscoreboard players reset @e {1}\nfunction worldradio:songs/{0}/load\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run function aj:worldradio_boombox/animations/playing/play\nfunction worldradio:radio/songs/{0}/resume\n", songFolderName, obj));

                // pause.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "pause.mcfunction"),
                    string.Format("# Pause playback for {0}\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run function aj:worldradio_boombox/animations/playing/pause\n", songFolderName));

                // resume.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "resume.mcfunction"),
                    string.Format("# Resume playback for {0}\nexecute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] at @s run function worldradio:songs/{0}/tree/branch_0\n", songFolderName));

                // stop.mcfunction
                File.WriteAllText(Path.Combine(radioSongDir, "stop.mcfunction"),
                    string.Format("# Stop playback for {0}\nscoreboard players reset @e {1}\n", songFolderName, obj));

                Log("Generated connector functions in: data/worldradio/function/radio/songs/" + songFolderName);

                // Update or Add to Installed List
                var existing = GetInstalledSongs();
                var match = existing.FirstOrDefault(s => s.FolderName.Equals(songFolderName, StringComparison.OrdinalIgnoreCase));
                if (match != null)
                {
                    match.DisplayTitle = title;
                    match.ScoreboardObj = obj;
                    match.MaxTick = maxTick;
                }
                else
                {
                    int nextIdx = existing.Count > 0 ? existing.Max(s => s.Index) + 1 : 1;
                    existing.Add(new SongInfo
                    {
                        Index = nextIdx,
                        FolderName = songFolderName,
                        DisplayTitle = title,
                        ScoreboardObj = obj,
                        MaxTick = maxTick
                    });
                }

                RebuildPlaylistDispatchers(existing);
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

                // Delete radio connector directory
                string radioSongDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs", song.FolderName);
                if (Directory.Exists(radioSongDir)) Directory.Delete(radioSongDir, true);

                // Re-index remaining songs
                var remaining = GetInstalledSongs().Where(s => !s.FolderName.Equals(song.FolderName, StringComparison.OrdinalIgnoreCase)).ToList();
                for (int i = 0; i < remaining.Count; i++)
                {
                    remaining[i].Index = i + 1;
                }

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

        private void RebuildPlaylistDispatchers(List<SongInfo> songs)
        {
            string radioSongsDir = Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "songs");
            if (!Directory.Exists(radioSongsDir)) Directory.CreateDirectory(radioSongsDir);

            // 1. play_song.mcfunction
            var playLines = new List<string> { "# WorldRadio - Global Play Song Dispatcher" };
            foreach (var s in songs)
            {
                playLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} run function worldradio:radio/songs/{1}/play", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "play_song.mcfunction"), playLines);

            // 2. pause_song.mcfunction
            var pauseLines = new List<string> { "# WorldRadio - Global Pause Song Dispatcher" };
            foreach (var s in songs)
            {
                pauseLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} run function worldradio:radio/songs/{1}/pause", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "pause_song.mcfunction"), pauseLines);

            // 3. resume_song.mcfunction
            var resumeLines = new List<string> { "# WorldRadio - Global Resume Song Dispatcher" };
            foreach (var s in songs)
            {
                resumeLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} run function worldradio:radio/songs/{1}/resume", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "resume_song.mcfunction"), resumeLines);

            // 4. stop_song.mcfunction
            var stopLines = new List<string> { "# WorldRadio - Global Stop Song Dispatcher" };
            foreach (var s in songs)
            {
                stopLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} run function worldradio:radio/songs/{1}/stop", s.Index, s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "stop_song.mcfunction"), stopLines);

            // 5. check_finished.mcfunction
            var finishLines = new List<string> { "# WorldRadio - Global Song Finish Check" };
            foreach (var s in songs)
            {
                finishLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,limit=1] if score @s {1} matches {2}.. run function worldradio:radio/internal/on_song_finished", s.Index, s.ScoreboardObj, s.MaxTick));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "check_finished.mcfunction"), finishLines);

            // 6. announce_song.mcfunction
            var announceLines = new List<string> { "# WorldRadio - Announce Song Actionbar" };
            foreach (var s in songs)
            {
                announceLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} run title @a actionbar [\"\",{{\"text\":\"Now Playing: \",\"color\":\"gray\"}},{{\"text\":\"{1}\",\"color\":\"aqua\",\"bold\":true}}]", s.Index, s.DisplayTitle));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "announce_song.mcfunction"), announceLines);

            // 7. load_songs.mcfunction
            var loadLines = new List<string> { "# WorldRadio - Load All Song Objectives" };
            foreach (var s in songs)
            {
                loadLines.Add(string.Format("function worldradio:songs/{0}/load", s.FolderName));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "load_songs.mcfunction"), loadLines);

            // 8. set_display_text.mcfunction
            var displayLines = new List<string> { "# WorldRadio - Update Boombox Text Display" };
            foreach (var s in songs)
            {
                displayLines.Add(string.Format("execute if score #current_song worldradio.data matches {0} as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value '{{\"text\":\"Now Playing:\\n{1}\",\"color\":\"white\",\"alignment\":\"center\"}}'", s.Index, s.DisplayTitle));
            }
            File.WriteAllLines(Path.Combine(radioSongsDir, "set_display_text.mcfunction"), displayLines);

            // 9. Update status.mcfunction
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
                "# Boombox counts",
                "tellraw @a [{\"text\":\" Active Boomboxes: \",\"color\":\"gray\"},{\"score\":{\"name\":\"#boombox_count\",\"objective\":\"worldradio.data\"},\"color\":\"light_purple\",\"bold\":true}]",
                "tellraw @a [{\"text\":\"=================================\",\"color\":\"dark_green\"},\"\\n\"]"
            });
            File.WriteAllLines(Path.Combine(datapackRoot, "data", "worldradio", "function", "radio", "status.mcfunction"), statusLines);

            // 10. Update load.mcfunction total songs
            string mainLoadFile = Path.Combine(datapackRoot, "data", "worldradio", "function", "load.mcfunction");
            if (File.Exists(mainLoadFile))
            {
                string loadContent = File.ReadAllText(mainLoadFile);
                loadContent = Regex.Replace(loadContent, @"scoreboard\s+players\s+set\s+#total_songs\s+worldradio\.data\s+\d+",
                    string.Format("scoreboard players set #total_songs worldradio.data {0}", songs.Count));
                File.WriteAllText(mainLoadFile, loadContent);
            }

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

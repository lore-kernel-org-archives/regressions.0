Received: from ns2.wdyn.eu (ns2.wdyn.eu [5.252.227.236])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FAE2560
	for <regressions@lists.linux.dev>; Thu, 12 Jan 2023 11:02:18 +0000 (UTC)
Message-ID: <06fd2857-b156-459b-0f3a-efd1c938bdab@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1673521335;
	bh=Hx7HwE8j+zhwj1rdPimj5gri42FJt9qOjuqZUOFTvRU=;
	h=Date:Subject:From:To:References:Cc:In-Reply-To;
	b=dl4oGlcQAhy9/WrcgXdgf0rqaDZs5rID+I7uqQ/Qzzmwjo/LfnUUwksUAldCH5a0K
	 vaqW3G6jfDCXBUx8OCV5fC6PreoVIML97pXq9SooTUhwClaihVeshfk1LyZgyzgJWK
	 pHZKhiF/j+l6I1egNjxWUeisqPSuLEmk0pTxVaQs=
Date: Thu, 12 Jan 2023 12:02:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Potential virtio regression in 6.2.0-rc2-wt+
Content-Language: en-US
From: Alexander Wetzel <alexander@wetzel-home.de>
To: virtualization@lists.linux-foundation.org
References: <815779f7-203a-4c77-59b9-09debb032b26@wetzel-home.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
In-Reply-To: <815779f7-203a-4c77-59b9-09debb032b26@wetzel-home.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.01.23 21:22, Alexander Wetzel wrote:
> Hello,
> 
> I've a potential regression with the kernel 6.2.0-rc2-wt+. (The 
> Custom patches on top of the 6.2.0-rc2-wt tree are only mac80211 
> related and only touching tx path within mac80211.)
> 
> I have the system in the "broken" state and if there is anything I 
> can do to narrow down what is is.. tell me. I'll try to keep the 
> broken VM "running" as long as I can. (For sure some hours, probably 
> not more than 24h.)
> 
> I suspect that this is not really ext4 fault but some underlying 
> block driver with the main suspect being virtio. Unfortunately I 
> can't trigger the issue on demand. But I got it now the second time 
> after just updating the kernel to 6.2.0-rc2-wt+ three days ago.
> 
> Kernel 6.1.0-rc8-wt+ is probably ok. (I was using it longer and did 
> run the same hostapd hwsim tests with it.)
> 
> Ignoring the kernel the last SW update on the host was on Dez 30. At 
> that time the host was using 6.1.0-rc8-wt+. The kernel was updated to
> 6.2.0-rc2-wt+ on Jan 9. One day after that hit the issue the first 
> time and today again...
> 
> I'm running a debian (stable) VM for testing wireless patches with 
> kernel 6.2.0-rc2-wt+ (Just installed the VM one week ago.) The VM 
> host is running always using the same kernel but using gentoo 
> ~amd64.
> 
> Virtualization is kvm/libvirt with qcow2 images on btrfs with 
> copy-on-write disabled for the VM images. I did suspend the host
> with the VM running a few times, if that's of interest.
> 
> But now to what happens: While running hostapd hwsim tests the FS 
> sometimes switches to read only and fsck (from debian stable) seems 
> to be unable to fix the issue.
> 
> Here what I did see in dmesg in 9th of January:
> 
> [67018.413140] I/O error, dev vda, sector 101796024 op 0x1:(WRITE) 
> flags 0x800 phys_seg 1 prio class 2 [67018.416796] Aborting journal 
> on device vda1-8. [67018.421676] EXT4-fs error (device vda1): 
> ext4_journal_check_start:83: comm rs:main Q:Reg: Detected aborted 
> journal [67018.421767] EXT4-fs error (device vda1): 
> ext4_journal_check_start:83: comm systemd-journal: Detected aborted 
> journal [67018.422200] I/O error, dev vda, sector 100927488 op 
> 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 2 [67018.422232]
> Buffer I/O error on dev vda1, logical block 12615680, lost sync page
> write [67018.422298] JBD2: I/O error when updating journal superblock
> for vda1-8. [67018.424092] EXT4-fs error (device vda1): 
> ext4_journal_check_start:83: comm python3: Detected aborted journal 
> [67018.427371] I/O error, dev vda, sector 2048 op 0x1:(WRITE) flags 
> 0x3800 phys_seg 1 prio class 2 [67018.449193] Buffer I/O error on
> dev vda1, logical block 0, lost sync page write [67018.452434]
> EXT4-fs (vda1): previous I/O error to superblock detected
> [67018.457550] I/O error, dev vda, sector 2048 op 0x1:(WRITE) flags
> 0x3800 phys_seg 1 prio class 2 [67018.460972] Buffer I/O error on dev
> vda1, logical block 0, lost sync page write [67018.464121] EXT4-fs
> (vda1): previous I/O error to superblock detected [67018.464121]
> EXT4-fs (vda1): I/O error while writing superblock [67018.464133]
> EXT4-fs (vda1): Remounting filesystem read-only [67018.466579] I/O
> error, dev vda, sector 2048 op 0x1:(WRITE) flags 0x3800 phys_seg 1
> prio class 2 [67018.485373] Buffer I/O error on dev vda1, logical
> block 0, lost sync page write [67018.491251] EXT4-fs (vda1): I/O
> error while writing superblock [67018.491810] EXT4-fs (vda1): I/O
> error while writing superblock
> 
> For the second issue I had a serial console open:
> 
> [26911.580256][T177028] running hwsim test case 
> wpas_ctrl_nfc_tag_read [26911.589493][T177028] TEST-START 
> wpas_ctrl_nfc_tag_read @1673458316.059152 [26911.639577][T177028] 
> TEST-STOP wpas_ctrl_nfc_tag_read @1673458316.109216 
> [26911.885034][T177028] running hwsim test case 
> wpas_ctrl_nfc_get_handover [26911.895167][T177028] TEST-START 
> wpas_ctrl_nfc_get_handover @1673458316.364826
> [26911.953774][T177028] TEST-STOP wpas_ctrl_nfc_get_handover
> @1673458316.423414 [26912.188688][    C4] I/O error, dev vda, sector
> 101018024 op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 2
> [26912.216238][ T230] Aborting journal on device vda1-8.
> [26912.220964][  T440] EXT4-fs error (device vda1):
> ext4_journal_check_start:83: comm rs:main Q:Reg: Detected aborted
> journal [26912.221008][  T275] EXT4-fs error (device vda1):
> ext4_journal_check_start:83: comm systemd-journal: Detected aborted
> journal [26912.221439][    C0] I/O error, dev vda, sector 100927488
> op 0x1:(WRITE) flags 0x800 phys_seg 1 prio class 2 [26912.221459][
> C0] Buffer I/O error on dev vda1, logical block 12615680, lost sync
> page write [26912.221494][  T230] JBD2: I/O error when updating
> journal superblock for vda1-8. [26912.221644][T177028] EXT4-fs error
> (device vda1): ext4_journal_check_start:83: comm python3: Detected
> aborted journal [26912.222041][    C4] I/O error, dev vda, sector
> 2048 op 0x1:(WRITE) flags 0x3800 phys_seg 1 prio class 2
> [26912.222052][    C4] Buffer I/O error on dev vda1, logical block 0,
> lost sync page write [26912.222078][T177028] EXT4-fs (vda1): I/O
> error while writing superblock [26912.222085][T177028] EXT4-fs 
> (vda1): Remounting filesystem read-only [26912.223568][    C2] I/O 
> error, dev vda, sector 2048 op 0x1:(WRITE) flags 0x3800 phys_seg 1 
> prio class 2 [26912.234128][T177028] running hwsim test case 
> wpas_ctrl_bssid_ignore [26912.226166][    C2] Buffer I/O error on
> dev vda1, logical block 0, lost sync page write [26912.235370][
> T440] EXT4-fs (vda1): I/O error while writing superblock
> [26912.235380][ T275] EXT4-fs (vda1): previous I/O error to
> superblock detected [26912.236042][    C6] I/O error, dev vda, sector
> 2048 op 0x1:(WRITE) flags 0x3800 phys_seg 1 prio class 2
> [26912.236060][    C6] Buffer I/O error on dev vda1, logical block 0,
> lost sync page write [26912.236103][  T275] EXT4-fs (vda1): I/O error
> while writing superblock [34784.374358][  T275]
> systemd-journald[275]: Failed to write entry (22 items, 730 bytes),
> ignoring: Read-only file system [34784.381669][  T275]
> systemd-journald[275]: Failed to write entry (22 items, 715 bytes),
> ignoring: Read-only file system [34784.388593][  T275]
> systemd-journald[275]: Failed to write entry (22 items, 736 bytes),
> ignoring: Read-only file system [34784.397111][  T275]
> systemd-journald[275]: Failed to write entry (22 items, 713 bytes),
> ignoring: Read-only file system [34784.429262][  T275]
> systemd-journald[275]: Failed to write entry (22 items, 735 bytes),
> ignoring: Read-only file system
> 
> When it happend first I then rebooted in recovery mode and tried to 
> run fsck. Fsck from debian was unable to fix the issue. (It was 
> always telling me that FS still has errors. But did not had a
> working serial console und took no screenshot). So I powered down the
> VM, copied the qcow2 file to another disk and created a snapshot.
> Then I made the partitions accessible on the host via qemu-nbd and
> used the fsck from the gentoo host. Which was able to repair the FS
> without problems:
> 
> fsck from util-linux 2.38.1 e2fsck 1.46.5 (30-Dec-2021) /dev/nbd0p1: 
> recovering journal Setting free inodes count to 5727751 (was 5779185)
> Setting free blocks count to 9617710 (was 10462729) /dev/nbd0p1:
> clean, 768505/6496256 files, 16346322/25964032 blocks
> 
> I then powered on the VM (after disconnecting the VM disk from nbd
> of course). System was again working.
> 
> I then restored the VM snapshot prior to the fsck from the host and 
> tried the fsck from the running VM again... and now it was working!
> 
> It looks like a restart of the VM (terminating qemu) fixed whatever 
> was wrong.
> 
> When the issue now reoccurred I just reset the VM and booted into 
> recovery mode:
> 
> [    7.870293][  T155] virtio_blk virtio3: 8/0/0 default/read/poll 
> queues [    7.894900][  T165] iTCO_wdt iTCO_wdt.1.auto: Found a ICH9 
> TCO device (Version=2, TCOBASE=0x0660) [    7.926570][  T165] 
> iTCO_wdt iTCO_wdt.1.auto: initialized. heartbeat=30 sec (nowayout=0)
>  [    7.935359][  T165] lpc_ich 0000:00:1f.0: I/O space for GPIO 
> uninitialized [    7.938940][   T59] ACPI: \_SB_.GSIA: Enabled at
> IRQ 16 [    7.945668][   T59] i801_smbus 0000:00:1f.3: SMBus using
> PCI interrupt [    7.949763][   T59] i2c i2c-0: 1/1 memory slots 
> populated (from DMI) [    7.952639][   T59] i2c i2c-0: Memory type 
> 0x07 not supported yet, not instantiating SPD [    8.012765][  T155] 
> virtio_blk virtio3: [vda] 209715200 512-byte logical blocks (107 
> GB/100 GiB) [    8.024029][  T155]  vda: vda1 vda2 < vda5 > [ 
> 8.026378][  T182] virtio_net virtio1 enp1s0: renamed from eth0 [ 
> 8.053335][  T170] ahci 0000:00:1f.2: AHCI 0001.0000 32 slots 6 ports 
> 1.5 Gbps 0x3f impl SATA mode [    8.057873][  T170] ahci 
> 0000:00:1f.2: flags: 64bit ncq only [    8.072241][  T170] scsi 
> host0: ahci [    8.076082][  T170] scsi host1: ahci [    8.079111][ 
> T170] scsi host2: ahci [    8.082068][  T170] scsi host3: ahci [ 
> 8.085261][  T170] scsi host4: ahci [    8.088187][  T170] scsi
> host5: ahci [    8.090622][  T170] ata1: SATA max UDMA/133 abar 
> m4096@0xfea23000 port 0xfea23100 irq 61 [    8.093925][  T170] ata2: 
> SATA max UDMA/133 abar m4096@0xfea23000 port 0xfea23180 irq 61 [ 
> 8.097215][  T170] ata3: SATA max UDMA/133 abar m4096@0xfea23000 port 
> 0xfea23200 irq 61 [    8.100498][  T170] ata4: SATA max UDMA/133 abar
> m4096@0xfea23000 port 0xfea23280 irq 61 [    8.103788][  T170] ata5:
> SATA max UDMA/133 abar m4096@0xfea23000 port 0xfea23300 irq 61 [
> 8.107082][  T170] ata6: SATA max UDMA/133 abar m4096@0xfea23000 port
> 0xfea23380 irq 61 [    8.422282][  T188] ata2: SATA link down 
> (SStatus 0 SControl 300) [    8.425310][  T194] ata5: SATA link down 
> (SStatus 0 SControl 300) [    8.427706][  T190] ata3: SATA link down 
> (SStatus 0 SControl 300) [    8.429390][  T186] ata1: SATA link up 
> 1.5 Gbps (SStatus 113 SControl 300) [    8.431739][  T192] ata4:
> SATA link down (SStatus 0 SControl 300) [    8.434271][  T186]
> ata1.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100 [    8.436502][
> T186] ata1.00: applying bridge limits [    8.438490][  T196] ata6:
> SATA link down (SStatus 0 SControl 300) [    8.440849][  T186]
> ata1.00: configured for UDMA/100 [    8.442921][   T59] scsi 0:0:0:0:
> CD-ROM QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5 [    8.518746][
> T170] sr 0:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray [
>  8.521662][  T170] cdrom: Uniform CD-ROM driver Revision: 3.20
> Begin: Loading essential drivers ... done. Begin: Running 
> /scripts/init-premount ... done. Begin: Mounting root file system
> ... Begin: Running /scripts/local-top ... done. Begin: Running 
> /scripts/local-premount ... done. Begin: Will now check root file 
> system ... fsck from util-linux 2.36.1 [/sbin/fsck.ext4 (1) -- 
> /dev/vda1] fsck.ext4 -a -C0 /dev/vda1 [    8.902505][    C7] I/O 
> error, dev vda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio 
> class 2 /dev/vda1: recovering journal [    8.910154][    C7] I/O 
> error, dev vda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio 
> class 2 [    8.917192][    C7] I/O error, dev vda, sector 0 op 
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 2 [    8.920584][ C7] 
> I/O error, dev vda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 
> prio class 2 fsck.ext4: unabl[    8.926223][    C6] I/O error, dev 
> vda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 2 e
> to set superblock flags on /dev/vda1
> 
> 
> /dev/vda1: ********** WARNING: Filesystem still has errors 
> **********
> 
> fsck exited with status code 12 done. Failure: File system check of 
> the root filesystem failed The root filesystem on /dev/vda1 requires 
> a manual fsck
> 
> 
> BusyBox v1.30.1 (Debian 1:1.30.1-6+b3) built-in shell (ash) Enter 
> 'help' for a list of built-in commands.
> 
> (initramfs) fsck /dev/vda1 fsck from util-linux 2.36.1 e2fsck 1.46.2 
> (2[   39.521277][    C6] I/O error, dev vda, sector 0 op 0x1:(WRITE) 
> flags 0x800 phys_seg 0 prio class 2 8-Feb-2021) /dev/vda1: recovering
> journal [   39.551901][    C6] I/O error, dev vda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 2 [   39.559643][ C2]
> I/O error, dev vda, sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0
> prio class 2 [   39.564492][    C2] I/O error, dev vda, sector 0 op
> 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 2 fsck.ext4: unabl[ 
> 39.585097][    C2] I/O error, dev vda, sector 0 op 0x1:(WRITE) flags 
> 0x800 phys_seg 0 prio class 2 e to set superblock flags on /dev/vda1
> 
> 
> /dev/vda1: ********** WARNING: Filesystem still has errors 
> **********
> 
> (initramfs)
> 
> 
> I can reset the systems as often as I want, does not change. I did 
> not (yet) power down the VM to verify that it then starts to work 
> again.
> 

I now set the VM to off/on again. As expected the reboot is then
working, fsck just fixes the FS on reboot.

I'll update to rc3 and will report if it happens again...

Alexander


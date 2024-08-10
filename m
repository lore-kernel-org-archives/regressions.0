Received: from mail.praveen.org.uk (mail.praveen.org.uk [78.141.237.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8422745B
	for <regressions@lists.linux.dev>; Sat, 10 Aug 2024 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.141.237.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723250111; cv=none; b=uQhrLyy3F/AGYTg58ZjVyzK7N6uxcrrvVHZ9Rno3MR1cXD9vWGMqPRK1txNUvj9t8Fw7XVp+HwRlhRPBJn0ntucqByowxYMj3s4gWTI6IfKJDPNEoKmYjoByk4aZXcvmNRoVAp22cyEPp0xL9gODidVkIyVLV7a7D1sIi5mFYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723250111; c=relaxed/simple;
	bh=NfiyBoDrS/tdm+lc9Almp5uz4bzO0ZKbZ8wKsxgWkxI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiOBTb3KkaUbYwhX+cvySM0aN7Ray19/L4852oI9IagNMsJzHcPOp9HxNOkl7Gm1hgdCKpWWNC012Fc4OUJrZ0RCNU1V7yrwQToITgT3JW8gRJJpkaT6cnRQg7v/6lI8NawWCieQq2G34Nj0XpSUKvOl+b9dqoi6jBLSmjbD6Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=praveen.org.uk; spf=pass smtp.mailfrom=praveen.org.uk; dkim=pass (1024-bit key) header.d=praveen.org.uk header.i=@praveen.org.uk header.b=koTNZvO0; dkim=permerror (0-bit key) header.d=praveen.org.uk header.i=@praveen.org.uk header.b=9u5QRblv; arc=none smtp.client-ip=78.141.237.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=praveen.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=praveen.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=praveen.org.uk header.i=@praveen.org.uk header.b="koTNZvO0";
	dkim=permerror (0-bit key) header.d=praveen.org.uk header.i=@praveen.org.uk header.b="9u5QRblv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=praveen.org.uk;
	s=2108-rsa; t=1723249692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=0z5yTKDGIUiBoVfxnoH8DMBNcdInfUhZr4qmwZJvpaw=;
	b=koTNZvO0MDYap3CP8XfpNwivx44xooCJGdaflwbzUv+Mi6cp3mCtPPyFPb+z84jPk4vDzQ
	CnAh4TNwkJ1rtd4JM2nlMRcGfWz9cCtray+HolH0nqyIHHnmsFw1xbJY9I7+Pb+nOe3Ze/
	nYP960TwdM3hIcKjg1ShZ9pAaBDHQjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=praveen.org.uk;
	s=2108-ed; t=1723249692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=0z5yTKDGIUiBoVfxnoH8DMBNcdInfUhZr4qmwZJvpaw=;
	b=9u5QRblvTcG4u4UXFeQbApXz4+dO2qliT0rqShjNhrH3KUXuhp5BoG3vNRobo7Edd5g7YB
	PaRcaDriz0QQv9Cg==
Received: 
	by mail.praveen.org.uk (OpenSMTPD) with ESMTPSA id fb4c6b07 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <regressions@lists.linux.dev>;
	Sat, 10 Aug 2024 01:28:12 +0100 (BST)
Date: Sat, 10 Aug 2024 01:28:08 +0100
From: Abhinav Praveen <abhinav@praveen.org.uk>
To: regressions@lists.linux.dev
Subject: Bisected Regression:  Cache filling up causing drastic performance
 degradation on Linux 6.10.3
Message-ID: <f43jqpkjg7gehwtskurg5ze6omkcldme62u32ftsht32xevc5y@sdnm66w24ins>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I recently ran into an IO/Memory Management issue and posted about it on
the linux-mm mailing list here:
https://marc.info/?l=linux-mm&m=172306192530745&w=2

I have since bisected with mainline and found that:
956a17d9d050761e34ae6f2624e9c1ce456de204 is the first bad commit

The issue is present on mainline commit:
58d40f5f8131479a1e688828e2fa0a7836cf5358 (Fri Aug 9 10:23:18 2024)

The bisect log is below:
git bisect start
# status: waiting for both good and bad commits
# bad: [58d40f5f8131479a1e688828e2fa0a7836cf5358] Merge tag 'asm-generic-fixes-6.11-2' of git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
git bisect bad 58d40f5f8131479a1e688828e2fa0a7836cf5358
# status: waiting for good commit(s), bad commit known
# good: [a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6] Linux 6.9
git bisect good a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
# bad: [3e334486ec5cc6e79e7b0c4f58757fe8e05fbe5a] Merge tag 'tty-6.10-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect bad 3e334486ec5cc6e79e7b0c4f58757fe8e05fbe5a
# bad: [d34672777da3ea919e8adb0670ab91ddadf7dea0] Merge tag 'fbdev-for-6.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev
git bisect bad d34672777da3ea919e8adb0670ab91ddadf7dea0
# bad: [b850dc206a57ae272c639e31ac202ec0c2f46960] Merge tag 'firewire-updates-6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394
git bisect bad b850dc206a57ae272c639e31ac202ec0c2f46960
# good: [59729c8a76544d9d7651287a5d28c5bf7fc9fccc] Merge tag 'tag-chrome-platform-for-v6.10' of git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux
git bisect good 59729c8a76544d9d7651287a5d28c5bf7fc9fccc
# good: [101b7a97143a018b38b1f7516920a7d7d23d1745] Merge tag 'acpi-6.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm
git bisect good 101b7a97143a018b38b1f7516920a7d7d23d1745
# good: [47e9bff7fc042b28eb4cf375f0cf249ab708fdfa] Merge tag 'erofs-for-6.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs
git bisect good 47e9bff7fc042b28eb4cf375f0cf249ab708fdfa
# bad: [b2665fe61d8a51ef70b27e1a830635a72dcc6ad8] Merge tag 'ata-6.10-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
git bisect bad b2665fe61d8a51ef70b27e1a830635a72dcc6ad8
# bad: [aa5ccf29173acfaa8aa2fdd1421aa6aca1a50cf2] btrfs: handle errors in btrfs_reloc_clone_csums properly
git bisect bad aa5ccf29173acfaa8aa2fdd1421aa6aca1a50cf2
# good: [d3fbb00f5e21c6dfaa6e820a21df0c9a3455a028] btrfs: embed data_ref and tree_ref in btrfs_delayed_ref_node
git bisect good d3fbb00f5e21c6dfaa6e820a21df0c9a3455a028
# good: [5fa8a6baff817c1b427aa7a8bfc1482043be6d58] btrfs: pass the extent map tree's inode to try_merge_map()
git bisect good 5fa8a6baff817c1b427aa7a8bfc1482043be6d58
# bad: [9a7b68d32afc4e92909c21e166ad993801236be3] btrfs: report filemap_fdata<write|wait>_range() error
git bisect bad 9a7b68d32afc4e92909c21e166ad993801236be3
# bad: [85d288309ab5463140a2d00b3827262fb14e7db4] btrfs: use btrfs_get_fs_generation() at try_release_extent_mapping()
git bisect bad 85d288309ab5463140a2d00b3827262fb14e7db4
# bad: [65bb9fb00b7012a78b2f5d1cd042bf098900c5d3] btrfs: update comment for btrfs_set_inode_full_sync() about locking
git bisect bad 65bb9fb00b7012a78b2f5d1cd042bf098900c5d3
# bad: [956a17d9d050761e34ae6f2624e9c1ce456de204] btrfs: add a shrinker for extent maps
git bisect bad 956a17d9d050761e34ae6f2624e9c1ce456de204
# good: [f1d97e76915285013037c487d9513ab763005286] btrfs: add a global per cpu counter to track number of used extent maps
git bisect good f1d97e76915285013037c487d9513ab763005286
# first bad commit: [956a17d9d050761e34ae6f2624e9c1ce456de204] btrfs: add a shrinker for extent maps

The original issue (from my previous post) is as follows:

If I read from my Steam Library (this has about 430GiB of data), stored on an
ext4 formatted NVMe drive like this:

find /mnt/SteamLibrary/steamapps/common -type f -exec cat {} + -type f | pv >
/dev/null

I see that it initially starts reading at 800MiB/s (6.4 Gbps) then, once my
cache fills up (as shown by buff/cache in free), the read speed drops to as low
as 6MiB/s (48 Mbps) but periodically returns to 800MiB/s as the cache gets
freed.

When the cache fills, other tasks are also affected (e.g video playback
stutters or stops). I also see high CPU usage from kswapd0 and btrfs-cleaner
(which is strange because, again, it's an ext4 filesystem that I'm reading
from) using top.

Running echo 1 > /proc/sys/vm/drop_caches immediately improves performance.

But, instead, if I run the same read command in a Memory cgroup with memory.max
set to 500M, I get a solid 800MiB/s read speed without filling up the cache or
affecting other tasks.

TL;DR simply reading files seems to be enough to cause major system-wide
performance degradation. This also applies when updating games on Steam or
moving them between Library locations.

Anyone know if this is a bug or regression in Linux 6.10? Or whether there are
any tunables or Sysctls that could improve performance without manually running
things in CGroups?

This happens on a AMD 7950X3D with 96GB of ram.

I describe the same thing on my post at:
https://www.reddit.com/r/linuxquestions/comments/1emetro/cache_filling_up_causing_drastic_performance/

It also seems that someone else has experienced something similar here*:
https://www.reddit.com/r/linuxquestions/comments/1e83ltj/610_disk_caching_vs_memory_exhaustion_issues/

*Their issue seems to have been resolved by 6.10.2 however.
-- 
Abhinav Praveen

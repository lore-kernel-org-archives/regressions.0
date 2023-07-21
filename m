Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C73D75
	for <regressions@lists.linux.dev>; Fri, 21 Jul 2023 12:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62791C433C9;
	Fri, 21 Jul 2023 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689941131;
	bh=2AQxIoTyGf3wBdP9RkgYNMCZmXfeThTGtcTPWe0uoyc=;
	h=From:To:Cc:Subject:Date:From;
	b=pFkzDsDC26nvqcYtB+7lUsU26fSjqzfPEiu85U/kIsdI9Bo/LSnOfXjIzORhCgWKD
	 cn7VjEFZDu4mNTsT2R//bN8abOAT+V+W6uDaRx50g0vfJItv1ntWonez6NcSAbwZyl
	 quJO+hV953XZuoiP8tVYCUhd2waO4sstIkdLeD6m8NuZxtPEZXbqGDlwl2tdEnx1fK
	 Cyao4b1ecCoNYJrS6xf1UfVdlOtQ3MhZjqLbEnjBwL999026k4hYZF6n7iFKHBK9kc
	 UUw9rxzyXKZW5zcvMwjo/rG9Uvt4/vhPF+wcbUh/SY52JG4gXmki1FVKZk3apwNdTV
	 N3GQNfp29FlRA==
From: Kalle Valo <kvalo@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [regression] GNUmakefile broken on v6.5-rc1
Date: Fri, 21 Jul 2023 15:05:28 +0300
Message-ID: <87lef931x3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Masahiro,

For a long time I have been using GNUmakefile in the top level source
directory to change compilers, enable ccache etc. Here's a simplified
GNUmakefile example:

CROSS_COMPILE=/opt/cross/gcc-13.1.0-nolibc/x86_64-linux/bin/x86_64-linux-
include Makefile

This was working fine on v6.4. But I noticed that it got broken on
v6.5-rc1 and the host compiler is used instead of what I have specified
in CROSS_COMPILE variable. It looks like GNUmakefile is ignored.

I did a bisect and found the commit which broke this:

commit 5fc10e76fa2a96d0207ed4d0cc9d16fb61371f71
Author:     Masahiro Yamada <masahiroy@kernel.org>
AuthorDate: Tue Jun 27 08:30:13 2023 +0900
Commit:     Masahiro Yamada <masahiroy@kernel.org>
CommitDate: Wed Jun 28 01:35:02 2023 +0900

    kbuild: revive "Entering directory" for Make >= 4.4.1

Reverting this commit fixes the issue and GNUmakefile works again as
before. I'm using Debian 12 on x86 with GNU Make 4.3-4.1:amd64. Here's
the bisect log:

git bisect start
# status: waiting for both good and bad commits
# bad: [06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5] Linux 6.5-rc1
git bisect bad 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
# status: waiting for good commit(s), bad commit known
# good: [6995e2de6891c724bfeb2db33d7b87775f913ad1] Linux 6.4
git bisect good 6995e2de6891c724bfeb2db33d7b87775f913ad1
# good: [1b722407a13b7f8658d2e26917791f32805980a2] Merge tag 'drm-next-2023-06-29' of git://anongit.freedesktop.org/drm/drm
git bisect good 1b722407a13b7f8658d2e26917791f32805980a2
# good: [7fffbc71075dcb733068d711c2593127cdce86f0] sysctl: set variable sysctl_mount_point storage-class-specifier to static
git bisect good 7fffbc71075dcb733068d711c2593127cdce86f0
# bad: [e8069f5a8e3bdb5fdeeff895780529388592ee7a] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect bad e8069f5a8e3bdb5fdeeff895780529388592ee7a
# bad: [44aeec836da880c73a8deb2c7735c6e7c36f47c3] Merge tag 'char-misc-6.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect bad 44aeec836da880c73a8deb2c7735c6e7c36f47c3
# bad: [a74195876b95fce5f1c5b051b8c3b01e1b18a83b] Merge tag 'i3c/for-6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux
git bisect bad a74195876b95fce5f1c5b051b8c3b01e1b18a83b
# good: [d25f002575146d67b5ebea541e6db3696c957c25] Merge tag 'cxl-for-6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl
git bisect good d25f002575146d67b5ebea541e6db3696c957c25
# bad: [dfab92f27c600fea3cadc6e2cb39f092024e1fef] Merge tag 'nfs-for-6.5-1' of git://git.linux-nfs.org/projects/trondmy/linux-nfs
git bisect bad dfab92f27c600fea3cadc6e2cb39f092024e1fef
# good: [5e9e95cc9148b82074a5eae283e63bce3f1aacfe] kbuild: implement CONFIG_TRIM_UNUSED_KSYMS without recursion
git bisect good 5e9e95cc9148b82074a5eae283e63bce3f1aacfe
# good: [6ad477a69ad81bcdd515559fba2887ae71c9c0cc] NFSv4: Clean up some shutdown loops
git bisect good 6ad477a69ad81bcdd515559fba2887ae71c9c0cc
# good: [71025b8565a383223ea2d94325db37cdabbcc453] scripts/mksysmap: Ignore prefixed KCFI symbols
git bisect good 71025b8565a383223ea2d94325db37cdabbcc453
# bad: [ad2885979ea6657fa8d3da51a301ec0e998ad8e7] Merge tag 'kbuild-v6.5' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
git bisect bad ad2885979ea6657fa8d3da51a301ec0e998ad8e7
# bad: [f5983dab0ead92dc2690d147f0604a0badcac6a8] modpost: define more R_ARM_* for old distributions
git bisect bad f5983dab0ead92dc2690d147f0604a0badcac6a8
# bad: [5fc10e76fa2a96d0207ed4d0cc9d16fb61371f71] kbuild: revive "Entering directory" for Make >= 4.4.1
git bisect bad 5fc10e76fa2a96d0207ed4d0cc9d16fb61371f71
# good: [5fa94ceb793e93870541dc5a1235aec87b0871bc] kbuild: set correct abs_srctree and abs_objtree for package builds
git bisect good 5fa94ceb793e93870541dc5a1235aec87b0871bc
# first bad commit: [5fc10e76fa2a96d0207ed4d0cc9d16fb61371f71] kbuild: revive "Entering directory" for Make >= 4.4.1

Kalle

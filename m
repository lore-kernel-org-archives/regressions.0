Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B5022DFA4
	for <regressions@lists.linux.dev>; Sun, 11 Jan 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768125814; cv=none; b=vCMNpZyub5Uih74txoJHIBVuXuZny4zS+CwXkYqHMJ5FGvHe39JszW+vplldLe8h/ZDJ07oSd1ey2ykCHwbnnvzX5Isq/lfCsVw3gTuEU2nzxRz0yH/TaVD1ciNCldLT4HAmnPALOJt9l6yPHCiKpgVW6zexsW6s79TXc2MKeFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768125814; c=relaxed/simple;
	bh=pFIaYpRRPMjjtN4Tig5hPfgB0o4f7i4NjpC93QcNfKE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CP3ZqWG1GM9P8D5nCBwQ1rbpI0WlhiPuv8Ut6CucEf5zknDlM1u5WQs9M9sSDwuuhi+VTy2KA5tOadABCmd4lXD3BRyGhL0QTp9D26YC8Ct9lms5NU8zTJzaGbA207crQ/YgRImHxJ6lDQZooRU0mYxQYjq/2HQuifAmwo0elFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UqJ6+qVf; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UqJ6+qVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1768125802; x=1768385002;
	bh=pFIaYpRRPMjjtN4Tig5hPfgB0o4f7i4NjpC93QcNfKE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=UqJ6+qVfGazGF7erFkeZKnZe9acly3dn0qmCZJlSBRxQ8PmeoFTc7PTiyMpzbbztk
	 xdPqqX+7FgN0/c7ClGFpfSbCWA/zKRnCABw8u6gL3u0lOO4Apk7mMMjlRSlpgVrSl/
	 inMB06bDhfYQfrmezIUliNePHhXMJU1aC70PBA/8OO92sG8dGsh06aEbtM8sMIeUpr
	 gvudbxJnq6dcRyMYgM8UpkjI+TC/c6dK6sglsqwBJQtES9DNc1WJfbmng+shpcchYX
	 Y4aoWmGsIA7LUGk6XMLvxQxisexZCRsZFpykqCNywxPUefgeoNNWnjnT8DD1VbrcZA
	 x/N78GLFnfEBw==
Date: Sun, 11 Jan 2026 10:03:17 +0000
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: jollycar <jollycar@proton.me>
Cc: "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [REGRESSION] VirtualBox VM crashes (BSOD) during Windows installation on btrfs with kernels 6.18+ (works on 6.12 LTS)
Message-ID: <sT06uA3Gtv1kgeL80ZRMshbw6whJNUom-UxnS06H6eVrB4AqGWuzo0P23AhwOn3WsnAq9QfhFYciSAWK3eBeGaKjNJG1oSQLyclv4d2E0L4=@proton.me>
Feedback-ID: 175904438:user:proton
X-Pm-Message-ID: d5830a78e20cd011b57234af969d4d377238880c
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

#regzbot introduced: v6.12..v6.18

[1.] One line summary of the problem:
VirtualBox VM crashes with BSOD during Windows installation on kernels 6.18=
+ (works fine on 6.12 LTS)

[2.] Full description of the problem:
Windows 10 and Windows 11 installation inside VirtualBox consistently crash=
es with BSOD within 1-3 minutes on Linux kernels 6.18.3 and 6.19-rc3. The s=
ame VirtualBox configuration and VM image work perfectly on kernel 6.12 LTS=
. The BSOD errors vary each time (most recent: 0x80070470 - "file may be co=
rrupt or missing"). The host system remains completely stable with no logge=
d errors.

[3] Kernel & Hardware:
=C2=A0 =C2=A0- Kernel versions tested:
=C2=A0 =C2=A0 =C2=A0* Working: 6.12.63-1
=C2=A0 =C2=A0 =C2=A0* Broken: 6.18.3-2, 6.19.0-rc3-1
=C2=A0 =C2=A0- Distribution: Manjaro Linux
=C2=A0 =C2=A0- Architecture: x86_64
=C2=A0 =C2=A0- VirtualBox: 7.2.4 r170995 (vboxdrv vermagic: 6.18.3-2-MANJAR=
O SMP preempt mod_unload)

[4.] Filesystem and storage:
=C2=A0 =C2=A0- Root filesystem: btrfs on LUKS encryption
=C2=A0 =C2=A0- Mount options: zstd compression level 3, SSD optimizations, =
async discard, free space tree
=C2=A0 =C2=A0- VM storage: separate btrfs subvolume
=C2=A0 =C2=A0- btrfs device stats: all zeros (no errors)

[5.] Reproduction:
- Boot kernel 6.18.3-2 or 6.19.0-rc3
- Start VirtualBox 7.2.4 r170995
- Create new Windows 10 or Windows 11 VM
- Begin OS installation
- BSOD occurs within 1-3 minutes with varying errors (latest: 0x80070470)
- Issue is 100% reproducible on 6.18+, never occurs on 6.12

Additional context:
- Host system remains completely stable during VM crashes
- No btrfs errors in dmesg or device stats (all zero)
- Issue persists across multiple 6.18/6.19 releases over one month
- VirtualBox 7.2.4 modules load successfully on all kernel versions

Regards,
Jollycar

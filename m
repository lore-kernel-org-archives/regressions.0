Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794660617;
	b=irkX6kZsZILm83Dq90y0HWPhUTbYdZ3cTF9EzYWSnQ1qFzNiJhuc96I5UoL9qlyjaWXV
	 +FfSuWMyVJwWpkXs5V+RpK97e9QSEzOaFNmv3m8AmTmVoeka3J3fPf8n9mEMRcHiBaRxT
	 OX5jZIo+L1NZvt2FLPhXDVQ000YPmUIyDg3mYU097cH/WZIrl/W0tcklV1EWDM8Hz9/lC
	 3aIVSG6FW8gfi1mVMMpJjjSAwx5a6mbps55oX/IshsTBiuD23/kv5hLMZuTIZvOX5PDi+
	 MvHB7ozwBquvGNn4eOsZ1SKQVXKxJFiCFLSc9HwL0hkMa81q6W6thVWP86UCe7KF4Bg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
	b=Y4nKR3MH1D9XXtggwNGP8qTepNZ12cD/f4s9uDfU+t4LUzwj295IMAkMM4eiPb7n9ir7
	 O09nIpYqtApiXQa2f9tobCCv/rsBJLu/4YHOHCBpGd2Gpfj+CBAP+vK2ForNq77BGcKop
	 iroVx9dyM+pX29N34xnA4Zje3G+OeoHky5RWr5VgtuAhE9Vn5zZp1vpxF66wODm+ydF7b
	 jgi1Wcm7JTYJun9XAFJu4nXXS8CzSCEQDq0nkFirUE3Rg6325QM5GY/BF9OfFRG5s+IX1
	 cQD2O2XOZAuVBjHEokGzj3jPakw+2tKVQvHVVB7DJ4r14vy9/QpoltbAzVy3f3Da2uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh7mxLjC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A700606A329
	for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 12:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A700606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh7mxLjC
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1412477c88.1
        for <regressions@lists.linux.dev>; Sat, 14 Nov 2026 04:50:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794660616; cv=none;
        d=google.com; s=arc-20260327;
        b=JkbH9cjvve+yP1ORTHsWW4eOYA4WLVhr4wKekyMo/F+uG2nHC1qvEuHxGvXXn8iUYu
         Ueeku9XM9x/Pi7sQwEqN44bWEMoOZzHa2TiCzimSx/KVaDxpGH+NdGi1kB2j5mUFLByB
         zaC+UKmZACZBpAtb01QqZ7XrgiLs86T73qhfBCt/otcUgFakBmryX4PqLxsA4bJmFRMP
         AEyuW+IAULLc40tslb13B0NmrC27jL4nVmcaIVTUs1rMSVrnxPHW67FhYirpQGNAIZ+h
         uiDpqEssENDWOmTM5Fno7QjJwacVbhsHv5qz547SviHq7LqUagYRoxW6HDv1IKPk+yHv
         iYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        fh=eeRqCDMrj16lHKy/Y4FACgxnojveHEhF79B1TEe4HNw=;
        b=LBMzIE5uKUhcOf0rSAEakw3xtjgwLRWWjp3C9Qi8J8YTJe8inbu0TAeqKHUSOqz0pH
         jJz0IF3f7FScVbJ1geUZt6WoRmSlsp7vWelSc+LA2Nu3LM6ueKsADFT/Fe3B/A10cG7p
         LrW79W6QeBs4EVMQKSgaVXdyFqpYUvR4ftIBsNsZAAIJLj9ShERu+YGM7Gh2JsO69JMp
         icgLzkymXoyS2geLimnbsCO8+CkewUyr8wP3pkImXTNHJ8uSl012KW5piSuoVTFESCkX
         9+qRIi7R3gZNJ6JatOI0bkfxYms/mRFm6nTxF8DUjnvm8pByTvPd0m2iScMhgr6x6ef3
         iCBw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660616; x=1795265416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=qh7mxLjCMTyRS4fpeH+57AJ8BpKiFHXGRz8vMG+62IlIgPscQLjcN13cZCCwVVmMzQ
         71k0/9B1k+LlxADb2zmBw6C+whnlZexpOo1ZHKHIofTqBwx7sIPls1vp5uy3nf/vAhBE
         q7l55B4eKakPeOmpR7vgkq+EbB5WLDAzTvzaGR/YSevIyKTdz+BT8yrgexRBmzWcCgUm
         R29qSzAer8Uz4OGqnxgTC8ZA8xT4BsGoyDszo7FWXtZCUK9A3UxchmG6AwRN+o+7VUnp
         yjTQicIDExERHAH8Kvk+QTRBBUGkEL/OhEWtLjMhBwKu1/jEmgg5wGw+RNUTkGTul0vV
         vjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660616; x=1795265416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dkKz5yvSausCV1c/fbXQnDgv4ggD/tyHpRglM3aXlU=;
        b=KO/fDi4anDGXofQa6IFTN9PRhGBHy16OTYtVuCJ5DLE0NUFBcYCeFflG8ZvAomNQt2
         jt0xdK+ijN8+j0nTexnY6PdPtIpnnjwKsm593UT7Pl6ZyzK7Pjp0Bkq3Desq3IghFLhe
         bL28gBnlCoukL4sKRYHZQt4lbvYB/LKxcypwMYx9JA2x0r16Uvy7zrhAorHx80LwheIZ
         xS7VmT9pxydX5bDzW3bfBPRstBmm0mmNWTcrHw2fXlGH/0DUjYZXFWmqEgk1DbkzFpLn
         C3y6HR9cAxsZTTBFc7Jq5GWUHntzuf6gt0iaFK7otVI9nNIqo8/AgO/F8ksCf/YD4+l+
         bs/g==
X-Forwarded-Encrypted: i=1; AL+hErF1ZloxwAPxC/iIM82JRLKO5QD7j1KgFy9ltfcCGqtw+Magw4ZCjgVSBpQ0Kb1KaSe1qssrA/MfeM7oOw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9vjw6ousatSfBOhM537Ca8z4/4hCQmGLJ6vTw9a1/HCg1hvLFK
	rc5j778jSNcVq9LJyZRjGpR42zJ/33ACwHboqzxXFSbCmZCFsFoK+atlSvgBcUTISeL4L8MeYBB
	gvR4OvfqVRZF0LVmIYDoz0BklE81wLG8=
X-Gm-Gg: AYBFou0yTDsuvznWtXQLmAFVsGLtAaiyWHE6d0D1Ch2qVELvs436gACESXfbDdo5P2s
	J8Dk4dkGo0SJXpU4BwsFBHnsMwsOzwg0PGk7SF61PoPGBqKnK+6FzwTsWavvcOurze+njgDKiKa
	kLLa9fKnrEhNxWWUeNKE/iJuNPPPAm2iL1fFYphRa/vVfLfA21V/Z9ByjwGF0DD5Ipb+e+eNe/5
	topInvDIKbVwI8Ze2rzn57o32c+DkAh+zqVZ5RxQsMnET4cT/7i0b3zBabXOsES1TOvdNOMa9ir
	qT51KbhG0n/oYWnLP6n2+wuxTnKrcvLPLgYaNc9i1UOxR5pB6c0v3yyU73+yZ/o0XWo5DrH23W+
	1FazYcHvuhSPDvnAjOqH0ec4Iq6j7x2G6PAPVeJ1RHMF8K7MvK/UiiW1dsNvBIiVHDtxJ3U8UT5
	czRWdD+mHIhXSKRPtEimVRKjK6e2O9Dl8cGv1r9gHS
X-Received: by 2002:a05:701b:2608:b0:1ae:d447:6c84 with SMTP id
 a92af1059eb24-1b4f5f6471emr6935062c88.19.1794660614833; Sat, 14 Nov 2026
 04:50:14 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
In-Reply-To: <CAJ6F8CFSfgdZqaKMndGZtbaww32Xr_KVL3gA_2Jemgv9i9vskg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Smagghe?= <cle.smagghe@gmail.com>
Date: Sat, 14 Nov 2026 13:50:02 +0100
X-Gm-Features: AclHuK_R76m67a3L3t-pYvKsH2nE90VH0yHZRxCdMvakyYIbxZrTCTjMoJpBnWE
Message-ID: <CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com>
Subject: Re: [REGRESSION] ntfs3: existing files/dirs with ':' in their name
 became inaccessible in 7.3 (ads on by default)
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev, regressions@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Hi Konstantin,
>
> Since upgrading from 7.2.11 to 7.3.4, files and directories on an
> ntfs3 volume whose name contains a colon are listed by readdir but can
> no longer be looked up: stat/open/rename/unlink all fail with ENOENT.
> Nothing changed on the volume or in my fstab; the only change is the
> kernel. This is caused by commit be310476e886 ("fs/ntfs3: Add basic
> support for alternative data streams"), merged for v7.3-rc1, which
> enables the new 'ads' mount option by default.
>
> Example (the directory was created on Linux and was perfectly usable
> with 7.2.11):
>
>   $ ls -1b "Game Soundtracks" | grep Reverse
>   Reverse:\ 1999
>   $ ls Rever*
>   ls: cannot access 'Reverse: 1999': No such file or directory
>   $ stat "Reverse: 1999"
>   stat: cannot statx 'Reverse: 1999': No such file or directory
>   $ mv "Reverse: 1999" "Reverse - 1999"
>   mv: cannot stat 'Reverse: 1999': No such file or directory
>
> With 'ads' enabled, ntfs_nls_to_utf16() splits every lookup name at
> the first ':' and treats the rest as a stream name, so "Reverse: 1999"
> is looked up as stream " 1999" of a non-existent file "Reverse". The
> real directory entry is never matched.
>
> Why I think this should be treated as a regression:
>
> 1. Userspace that worked on 7.2 breaks on 7.3 without any
>    configuration change. Names with ':' are legal on NTFS (they exist
>    on volumes written by Linux, by ntfs-3g, by macOS, by WSL, ...),
>    and they are still returned by readdir, so the directory listing
>    and the lookup now disagree with each other. Tools like ls, find,
>    rsync or backup software report errors, and the files cannot even
>    be renamed or deleted to work around it.
>
> 2. There is no obvious way out. The current mount line is:
>
>      /dev/sdb1 on /mnt/HDD_2TB_WD type ntfs3
>      (rw,noatime,uid=3D1000,gid=3D1000,dmask=3D0000,fmask=3D0000,acl,
>       iocharset=3Dutf8,prealloc,ads)
>
>    'ads' is shown although it was never requested. Following
>    Documentation/filesystems/ntfs3.rst ("You can use every mount option
>    with no option"), I tried 'noads', which is rejected, because the
>    parser only registers fsparam_flag("ads") and fsparam_bool("ads").
>    The only way to get the old behaviour back is 'ads=3D0', which I only
>    found by reading the commit message.
>
> 3. Silently enabling a new syntax that changes the meaning of an
>    existing, valid file name is also a data safety concern: with a
>    regular file "a" present, an application asking to create "a:b"
>    now writes into a hidden stream of "a" instead of creating a new
>    file.
>
> Could you please make 'ads' opt-in (default off), or at the very
> least make lookup prefer an existing directory entry whose full name
> contains ':' before interpreting the name as file:stream? It would
> also help to accept 'noads' like the other options and document
> 'ads=3D0' in ntfs3.rst.
>
> Workaround confirmed here: mounting with 'ads=3D0' makes the entries
> accessible again.
>
> Environment:
>   Linux version 7.3.4-arch1-1 (linux@archlinux) (gcc (GCC) 16.2.1
>   20260810, GNU ld (GNU Binutils) 2.47) #1 SMP PREEMPT_DYNAMIC Wed,
>   11 Nov 2026 19:02:39 +0000
>   Arch Linux, x86_64
>   Last good: 7.2.11 (Arch)   First bad: 7.3.4 (Arch)
>   The Arch kernel carries no ntfs3 patches. I have not built mainline,
>   but in v7.4-rc2 fs/ntfs3/super.c still sets opts->ads =3D 1 by default
>   and has no "noads" parameter, so the behaviour is unchanged there.
>   The kernel is tainted (OE) by out-of-tree nvidia and tuxedo laptop
>   modules, which are unrelated to the filesystem path involved.
>
> fstab entry:
>   UUID=3D717D6EE943D0AF06 /mnt/HDD_2TB_WD ntfs3 x-systemd.automount,uid=
=3D1000,gid=3D1000,fmask=3D000,dmask=3D000,noatime,exec,rw 0 0
>
> #regzbot introduced: be310476e886
> #regzbot title: ntfs3: names containing ':' inaccessible since ADS suppor=
t is enabled by default
>
> Thanks,
> Cl=C3=A9ment Smagghe

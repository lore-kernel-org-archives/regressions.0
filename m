Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366D333EB09
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611127; cv=none; b=SNl7jLebDLumCyZe3hKSyFLpcubWoYYkjRavVIvC8BvBdyQLbX1aYmtMqGmmTUwz47FC3ZkQ+3lzCn+fLGVXPA9Eyy7fx4cH+0J1iMSI9u5sv6tm//dYNNMySKZnTgN3MzIxaY0gXMRAkPLD//MCrmVr6ZdJcS1mEUN4h4oAShs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611127; c=relaxed/simple;
	bh=SarDp3gPgO/YdgGtf3xtssRMRvDNPW1kKle/w7h6F4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sOumeNz83SnPfhokAONvCTdyB5oTMxnhlgRxiZJkeD38qSr3D2gjpmqmySXxmWqa6YzLN1PU/YUQm6TiyLtqpcXCYSq1kjqBaxGbhRpux5MJMjaNtcKEeumjRr8h5A+6mtUuh7i2Q7VfHdIesrde3aah2kFAeMP/3OsygjY6PKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyLpsfR6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyLpsfR6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78ead12so749835766b.1
        for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755611123; x=1756215923; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SarDp3gPgO/YdgGtf3xtssRMRvDNPW1kKle/w7h6F4U=;
        b=TyLpsfR68pOjJM7OpiTVlU7Bb8qrSdirHbQbtI51VdTN7XYHvFsvo7v3nD4Xd2fJAm
         0temHw09iKMR42XP0HbmsQHuXWSg0NNCl73I82eb8x+ZiYp6UCuN0kYjM04WiHikDSgn
         EUSzvh/bbEmu6H8LY6bdX3PdcMhS/bTrWcRXaABb5mmK5YJIrj4EAWdj784NtEUYhPoq
         zQKDmgewLiRVEerCsOOQo06aJF1wv+WpuvNeCOWzeGTmRrM4hDHZl4Mz3Axp0NT/Fhkx
         Mp6xiNzO7peUlc6tuDBc2Oq7tiwvmGYWPLXwt2y1Jb52RjeogYxD1n78+YWYr78843oG
         wdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755611123; x=1756215923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SarDp3gPgO/YdgGtf3xtssRMRvDNPW1kKle/w7h6F4U=;
        b=lI4qi0s2nduaUT47bTAVzG+1YO9AdhvkAm5AG+NkjdX21qT2Pq9r9dvaXhjevBDFZS
         wPPzti7blDP3lrJR/U/jYSs0pCcJmBlGVbaGFQZXWJQT9BABgqLobIiS6xP5r8Ft4lOQ
         8HErzKun8fbFb+YsdE0NgTHmpl8mE9OY1yG+FrYhMmNT8mmGgGLxGy0DodibKoSOQtnm
         AaULs2hcAWaWwLxBAwDMHhlMI/ZJvoCfyK1+YKGOhZlv4AV+Y7iKTH1He68uCbVz1xLC
         0wPL/WYv0agaKvFYPTlNDdTRJS8nDl5EXi+thKfqV4nTMRSdnehsrIAHqOaSljaFJaeZ
         0G9g==
X-Gm-Message-State: AOJu0Yz82DzU9we/V5+yI1JEy19NyiT+P65y4rgrqR24XeNyWL3IhDB/
	5pg5e6zmObS4vgV9EmvECKUge9he08/WAKhJL8mFuOc3kDov628rV2FSXXAlPEdpA07KdkJhdmc
	F1DmdIF0RDoPYqAd5vMBOFQoJopfAp5Q2/naT5RuThg5k
X-Gm-Gg: ASbGncvv7+IRgS8LuthdmlJ5sTkpfbl2xgdGD2EA0zFhhyOfN9yvJ5kJhJXmqAZMh/w
	fnSbOryAz/0hDwkG6sS4YIe74IbHaeWnMJBJWQnQEVtrbVVt3NUj/HqRXgNnk2jri5IAP28EUXt
	rrsQX5XM/YS4QWyJm5EokskAFs//BqhPruGtmxjCkilAVz/o6xZSDfmjfMSzSpQYERATj3mxc2H
	xoPa0A=
X-Google-Smtp-Source: AGHT+IGuEnssLntoKTg06N8UVz0+UwKwOhj3+VWR97223SWuRF4IgMIPW9I5hYz5V+54tTv67rXumI/lXzSaP19IpJs=
X-Received: by 2002:a17:906:dc8b:b0:af9:1d21:65a1 with SMTP id
 a640c23a62f3a-afddc95a1dbmr279438766b.11.1755611122852; Tue, 19 Aug 2025
 06:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com> <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
 <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
 <CACTEcX7oa+Shj=uYiRMoWpng+RZXDeQrOa-VTRmzVVtXJMCgLQ@mail.gmail.com> <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
In-Reply-To: <CACTEcX7hsRkzYEBg4pQd5s36p_ZXJM=dtxSGmBjfkt5sWrXP8g@mail.gmail.com>
From: Andy Mindful <andy.mindful@gmail.com>
Date: Tue, 19 Aug 2025 16:45:11 +0300
X-Gm-Features: Ac12FXzUXiaf2APgZGDQHtK929W1yQQZJ8xoGGhTI90NnJ6i0iL0VZZKQ0T6JiQ
Message-ID: <CACTEcX4CBv9BTgvSrhJsFvPYLm_e5ms1PWzxsjv-hnudxiRTTw@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: regressions@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-acpi@vger.kernel.org, rafael@kernel.org, ville.syrjala@linux.intel.com, 
	tglx@linutronix.de, Christian Brauner <brauner@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

Hello,

I've tried to bisect this again on a branch 'linux-6.8.y' @ linux-stable.

I made a commit log via: git log --oneline > commits-linux-6.8.y.txt
And started manually searching bad and good commits, this is the log:
3a2bd2b150f4 - bad
35a4474b5c3d - bad
dc97f6344f20 - bad
b85ea95d0864 - bad
ffc253263a13 - good

Once I have good, I switched back to: git checkout linux-6.8.y and
started bisecting,
which lead to below log:

git bisect start
# status: waiting for both good and bad commits
# bad: [3a2bd2b150f45844d99267696256716e4f23bf53] printk: Use
prb_first_seq() as base for 32bit seq macros
git bisect bad 3a2bd2b150f45844d99267696256716e4f23bf53
# status: waiting for good commit(s), bad commit known
# bad: [35a4474b5c3dd4315f72bd53e87b97f128d9bb3d] Merge tag
'bcachefs-2024-01-21' of https://evilpiepirate.org/git/bcachefs
git bisect bad 35a4474b5c3dd4315f72bd53e87b97f128d9bb3d
# status: waiting for good commit(s), bad commit known
# bad: [dc97f6344f205b0dfa144e1b3e16d6dc05383d57] cxl/pci: Register
for and process CPER events
git bisect bad dc97f6344f205b0dfa144e1b3e16d6dc05383d57
# status: waiting for good commit(s), bad commit known
# bad: [b85ea95d086471afb4ad062012a4d73cd328fa86] Linux 6.7-rc1
git bisect bad b85ea95d086471afb4ad062012a4d73cd328fa86
# status: waiting for good commit(s), bad commit known
# good: [ffc253263a1375a65fa6c9f62a893e9767fbebfa] Linux 6.6
git bisect good ffc253263a1375a65fa6c9f62a893e9767fbebfa
# good: [7d461b291e65938f15f56fe58da2303b07578a76] Merge tag
'drm-next-2023-10-31-1' of git://anongit.freedesktop.org/drm/drm
git bisect good 7d461b291e65938f15f56fe58da2303b07578a76
# good: [2a80532c0745e140852e6b579bbe8371332bb45d] Merge tag
'printk-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux
git bisect good 2a80532c0745e140852e6b579bbe8371332bb45d
# good: [2a80532c0745e140852e6b579bbe8371332bb45d] Merge tag
'printk-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux
git bisect good 2a80532c0745e140852e6b579bbe8371332bb45d
# bad: [e70703890b2586bc3567365d391c260d23fb7a94] Merge tag
'topic/nvidia-gsp-2023-11-03' of git://anongit.freedesktop.org/drm/drm
git bisect bad e70703890b2586bc3567365d391c260d23fb7a94
# good: [b06f58ad8e8c4154bc88d83b4fd70f74ede50193] Merge tag
'driver-core-6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
git bisect good b06f58ad8e8c4154bc88d83b4fd70f74ede50193
# good: [1f24458a1071f006e3f7449c08ae0f12af493923] Merge tag
'tty-6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect good 1f24458a1071f006e3f7449c08ae0f12af493923
# bad: [bfafa2c19d706ab1db0b581f9d3886469fab8627] Merge tag
'phy-for-6.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy
git bisect bad bfafa2c19d706ab1db0b581f9d3886469fab8627
# bad: [9b6db9a3a675fc2f33b587a9909dcef20c4b3794] Merge tag
'thunderbolt-for-v6.7-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into
usb-next
git bisect bad 9b6db9a3a675fc2f33b587a9909dcef20c4b3794
# good: [efa33cd89c8acc510ed0e4dbf98fc1cf3220b9dc] USB: typec:
tps6598x: Add status trace for tps25750
git bisect good efa33cd89c8acc510ed0e4dbf98fc1cf3220b9dc
# bad: [ff8e4630fa3c1f8775f162ceaf52ba8b656927de] usb: gadget:
lpc32xx-udc: Convert to use module_platform_driver()
git bisect bad ff8e4630fa3c1f8775f162ceaf52ba8b656927de
# bad: [c087fada0a6180ab5b88b11c1776eef02f8d556f] xhci: Clean up stale
comment on ERST_SIZE macro
git bisect bad c087fada0a6180ab5b88b11c1776eef02f8d556f
# bad: [5220d8b04a840fa09434072c866d032b163419e3] dt-bindings: usb:
gpio-sbu-mux: Make 'mode-switch' not required
git bisect bad 5220d8b04a840fa09434072c866d032b163419e3
# bad: [1034cc423f1b4a7a9a56d310ca980fcd2753e11d] gpio: update Intel
LJCA USB GPIO driver
git bisect bad 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
# bad: [bfd3824c88081f9b2101d68376f14779ce26691f] i2c: Add support for
Intel LJCA USB I2C driver
git bisect bad bfd3824c88081f9b2101d68376f14779ce26691f
# good: [acd6199f195d6de814ac4090ce0864a613b1580e] usb: Add support
for Intel LJCA device
git bisect good acd6199f195d6de814ac4090ce0864a613b1580e
# first bad commit: [bfd3824c88081f9b2101d68376f14779ce26691f] i2c:
Add support for Intel LJCA USB I2C driver

Can you please advise, if it makes sense and results are accurate?

Best regards!
Andriy

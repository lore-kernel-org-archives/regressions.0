Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83056277030
	for <regressions@lists.linux.dev>; Fri,  8 Aug 2025 13:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754658901; cv=none; b=Nl+MNA0awAMp3wiPaEeDp9a6cx1wsl6EweTOxMn5dJNatrwC1z1W62VRzmMZKDywX92+3OKCVOjcAqkIrKGzPf00WO85VdcHaF/IgbAPHsS/Uu0FljFb1GDg4OsylxAe/JCcp2FQVvSwavpxai88/N0kl65JQPT6v7b2fc+v8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754658901; c=relaxed/simple;
	bh=LzZ2gmBzKad8vP6vcqj+QiAbXuf+vjCf/xlWhLPeWco=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=p23HlkV46dVQy8qYfGR3GFVo6Oe1tvucXuUT6n4uo9YSViYtzVSPojfWT50dfgA2ZI/DXHbOvPa+Oo7MyBnsppdn3QQYgyHFUz5LzBr14/3AQ3NTcIfODjJp21PEs0g6uPpbIpnaAUp9VktSvjdj1WZSRM7XELzEMHKEwu8ru30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKChVLlM; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKChVLlM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-617c40825c9so3285298a12.2
        for <regressions@lists.linux.dev>; Fri, 08 Aug 2025 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754658898; x=1755263698; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1G84+v4zX75P6WqTk0EXQj0TqNSq6e+rkwRaOXJCVZ4=;
        b=eKChVLlM9T20agDcM4bAAKIUAxQd4z/QaNY3BZ61hIMX9bkZD0/jo92soqoA8cc84a
         bbryYu1oFiy+shsKnuQvCnNsp+nut82HKCwxtsd+SrJNcyxMMwvtpMQb8JiQr4OGrTSn
         iY9tAMVsl4yQyyFKmRNv3WupOTTiQ8XRtrrlKT1d+yk9vzkjzocL9VplldTj38v/z5ma
         SsW1TYJCoHSUBuViCC1zvBr5qF4SAI4XLdL1vqZtBupAllxdOdZn1DbUF8ERM5LnOBUv
         /fDUoRkXlm5FCR+ebplGJZlZJ0hifveLkN+1CnMgGop7f92rDlnI6eIeJSEEuSz+612h
         xk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754658898; x=1755263698;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G84+v4zX75P6WqTk0EXQj0TqNSq6e+rkwRaOXJCVZ4=;
        b=clQ9mxXfLJ0efllRX9q94/l1sMVO8zM5TmlTa7M5CLZud9Uv7RsoNo+ny/L3OdIC0k
         h5THLUDoMZLIhz+0kNc48MsY8vH3H70wc9n2uqlD3CONi9lgD4nHvtenV2lPEE70k+sv
         D7ytCyibl2mbeFlJTKUE6rBxaGDGUgS1Gv9EdMZF5qQq/bpYJ6g2quCpYpBTkgtxH/qY
         hq17WC/yW8fk+u4AkjJvYyxAfPeDJUvY4e0UA/3iMOjhZHgZvw/5Ojydcc/JWHWYANYa
         JTAa1ZxeZ2b1TyTqSnAuvmw9Cf5+UDK8MFEF4qb/BPc5+pga9Z6ralqaAPYj1XzSP0hQ
         6ifA==
X-Forwarded-Encrypted: i=1; AJvYcCU7eHPf5SC1+9xsIpYubXg2kSSpQljf9673ZQ0qnCQmxaiTWN3aZxDHlmstmGDx1MvKixWj/5O9OlL62w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwR2+Pxhp/fvfQ9Ew5i50JigZ9L35K3kjTTQVP0pMrxE5Gv71fW
	hbwjJO9Eoz/DiKyoPiOZ5hMvsGe5X+r/geGohMfP10N1dllZLbE907C7GGMFqVE+dFzvSmXF2Pl
	JTBBcs++2t3w2pf3JkFgG0l+lmWoZvT4=
X-Gm-Gg: ASbGncslZnZHaoyufmIoXl3vuHRud+DYwhV8ccMGoa0duELS/DaX7/y2WVg8KEu59er
	asAU4pTsn7YLT7XLfPknmmFcw0hV2eun9x5OjOIXGFxKIch79p2YQ5dbcqbbMUqkpUyyuBqrrz0
	GKL8hN/BgSwJzSW219SefihafvLqocHcuvs77ftAI8JmjHEZffkHHjAeadpPH2hEWcJ1xajAPlS
	57qbMySTTArts127lT1
X-Google-Smtp-Source: AGHT+IGevCoZbL9izzwy5cwLKx4/i/TmXKqJBSAQOcJkM9XKP6Ea/sJmVJxiOYQUmUx3N5L5pL8CK1+aI275dIXumZs=
X-Received: by 2002:a05:6402:2547:b0:602:1b8b:2925 with SMTP id
 4fb4d7f45d1cf-617e2e95eeamr1953333a12.29.1754658897651; Fri, 08 Aug 2025
 06:14:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tal Inbar <inbartdev@gmail.com>
Date: Fri, 8 Aug 2025 16:14:46 +0300
X-Gm-Features: Ac12FXzGwyXXWIsqoqW4GYVdq-yIoDbSx7m80eMIrFIy-Ylc2aYJJ2tFHDO8ZrQ
Message-ID: <CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com>
Subject: [REGRESSION] [BISECTED] MT7925 wireless speed drops to zero since
 kernel 6.14.3 - wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Since kernel v6.14.3, when using wireless to connect to my home router
on my laptop, my wireless connection slows down to unusable speeds.


More specifically, since kernel 6.14.3, when connecting to the
wireless networks of my OpenWRT Router on my Lenovo IdeaPad Slim 15
16AKP10 laptop,
either a 2.4ghz or a 5ghz network, the connection speed drops down to
0.1-0.2 Mbps download and 0 Mbps upload when measured using
speedtest-cli.
My laptop uses an mt7925 chip according to the loaded driver and firmware.


Detailed Description:

As mentioned above, my wireless connection becomes unusable when using
linux 6.14.3 and above, dropping speeds to almost 0 Mbps,
even when standing next to my router. Further, pinging archlinux.org
results in "Temporary failure in name resolution".
Any other wireless device in my house can successfully connect to my
router and properly use the internet with good speeds, eg. iphones,
ipads, raspberry pi and a windows laptop.
When using my Lenovo laptop on a kernel 6.14.3 or higher to connect to
other access points, such as my iPhone's hotspot and some TPLink and
Zyxel routers - the connection speed is good, and there are no issues,
which makes me believe there's something going on with my OpenWRT
configuration in conjunction with a commit introduced on kernel 6.14.3
for the mt7925e module as detailed below.

I have followed a related issue previously reported on the mailing
list regarding a problem with the same wifi chip on kernel 6.14.3, but
the merged fix doesn't seem to fix my problem:
https://lore.kernel.org/linux-mediatek/EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8_xMBaPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=@pm.me/

I've tested stable builds of 6.15 as well up to 6.15.9 in the last
month, which also do not fix the problem.
I've also built and bisected v6.14 on june using guides on the Arch
Linux wiki, for the following bad commit, same as the previously
mentioned reported issue:

[80007d3f92fd018d0a052a706400e976b36e3c87] wifi: mt76: mt7925:
integrate *mlo_sta_cmd and *sta_cmd

Testing further this week, I cloned mainline after 6.16 was released,
built and tested it, and the issue still persists.
I reverted the following commits on mainline and retested, to
successfully see good wireless speeds:

[0aa8496adda570c2005410a30df963a16643a3dc] wifi: mt76: mt7925: fix
missing hdr_trans_tlv command for broadcast wtbl
[cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1] wifi: mt76: mt7925:
integrate *mlo_sta_cmd and *sta_cmd

Then, reverting *only* 0aa8496adda570c2005410a30df963a16643a3dc causes
the issue to reproduce, which confirms the issue is caused by commit
cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1 on mainline.

I've attached the following files to a bugzilla ticket:

- lspci -nnk output:
https://bugzilla.kernel.org/attachment.cgi?id=308466

- dmesg output:
https://bugzilla.kernel.org/attachment.cgi?id=308465

- .config for the built mainline kernel:
https://bugzilla.kernel.org/attachment.cgi?id=308467


More information:

OS Distribution: Arch Linux

Linux build information from /proc/version:
Linux version 6.16.0linux-mainline-11853-g21be711c0235
(tal@arch-debug) (gcc (GCC) 15.1.1 20250729, GNU ld (GNU Binutils)
2.45.0) #3 SMP PREEMPT_DYNAMIC

OpenWRT Version on my Router: 24.10.2

Laptop Hardware:
- Lenovo IdeaPad Slim 15 16AKP10 laptop (x86_64 Ryzen AI 350 CPU)
- Network device as reported by lscpi: 14c3:7925
- Network modules and driver in use: mt7925e
- mediatek chip firmware as of dmesg:
  HW/SW Version: 0x8a108a10, Build Time: 20250526152947a
  WM Firmware Version: ____000000, Build Time: 20250526153043


Referencing regzbot:

#regzbot introduced: 80007d3f92fd018d0a052a706400e976b36e3c87


Please let me know if any other information is needed, or if there is
anything else that I can test on my end.

Thanks,
Tal Inbar

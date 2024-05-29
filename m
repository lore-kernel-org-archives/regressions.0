Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C38171AA
	for <regressions@lists.linux.dev>; Wed, 29 May 2024 04:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716957960; cv=none; b=eW9z+SA9LmR5JptE90O2+Wk/O4/K6yBz0T1JEGlhia8hdjHyBG9JRulkuHmO2jY3O2mJ7v1nfEk+jIgxtC8h0Ux0T3fxborRbi5TiWy3JYwm+6cWjpaUtBrtk56gOn5tOMPlym0eNqxcJicZSYMPoAcgltdK6qPLAtitRWrSceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716957960; c=relaxed/simple;
	bh=IhGPpAFwr9pA9nbZF5l0LlG/5ijkIfQOA+hf2vYOh5I=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lwF70Npq2A3AxyIk6v1Ic76+UAhbjcyzM/I6J5wBMItM14I1fy5WB2yQDceVtxnbaLBz3PGx2a/xZtcDISQQcHJLfwCXAgvMHyp/OsIc7maIalCtgCa4aXnsc7LtpRk9m5RJTGlieBhrjkm+maNGtkYTRFCfd4Rj6wGHlRW7XNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=D7Sqmi3T; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="D7Sqmi3T"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43fdb114e07so6535901cf.2
        for <regressions@lists.linux.dev>; Tue, 28 May 2024 21:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1716957958; x=1717562758; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmpWYn0uCMbm3fxqDNBcySeG4f+66JRUG6mgZL8L6is=;
        b=D7Sqmi3TOf1UWqgX/H/ILSHv4nN6QpV5mB6VnbYlSfuvY52szawFmDLqYoafuDm7Gv
         xlb5iWQTGrbX9Gc8sZnTHXMMs5JmoEd7YQF3HQZassf52dNoYc8/TQ/hUvTIHeaSg3R+
         EVrg5EQovVBaOui1bWo2dulIbJyNOWlghh/OBuBVYUbycZmFkKw9Gu50ZU3uq8f84oIE
         NTrLLLNOKt25ithor2DEwofbhEVTdF6IoFA9CoDDmzXu2LMCNybdyIkvn2hZnpiRlBQU
         bRKsTt1OUK/QV1irnMk3oHZSfN901PDZbJtlSAeuh4LJarprqSDZs0tv55rVrBpSpeSW
         jFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716957958; x=1717562758;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmpWYn0uCMbm3fxqDNBcySeG4f+66JRUG6mgZL8L6is=;
        b=M2eHjn0m7Ulujm9q4LFW+CQ6I9PywKbZWpa9IYfFVHT280DYtEJ0r3G8jc7aht/6gx
         ATlnVIVpEsc1cvQ95+VUdOkBPk9HOv8PgaMZVcH/RrzSOu9UiFrotBl+rk9qoNZFfVQO
         c7gNBoAnDw1i4AsU+qJHTqyFQBXMVgHSp2bOkugUMYv9NQ+stH/I7xQfSUrA8sipNQj/
         LkncZz8VbmvXPUnxINUZWz/n+mRTfwVlS+sFnPvNunWfdZ5iJdcAS/Buqu2+czuLKG65
         ZmcBax+EOunzJ4g0ZbAjIJb9JRgHfdXH6GYHPopUvpP9oE9nYz/7jeG80HPWf4ZZlNXy
         cV2A==
X-Forwarded-Encrypted: i=1; AJvYcCXFqHohCK6h2KKnabET/EDArIJAyKQdN+LKH4U1Z5aGURX+FV7PV4Wt5fwFu2Zu+A512ClPp9GnnA591qU8YegtaSk2sCaerQmFei8=
X-Gm-Message-State: AOJu0Yzt5bneBMbLuci/tGDDHKnjGbQXXZvoTnrCnoZccvGW4V+fHpbr
	3064R1JaYkTn6wD+2SCsWUaGj5NjTRU44XgiyCgSqkSERCTLo2dZaZPiWj4fCCXJ5r6ssgEPyx/
	p
X-Google-Smtp-Source: AGHT+IEEf4vTlM5wsCU/rnICErZFc3oLKNreJcyTI3aQmp7FVT3q5CR5E3rKudVnwFa/8XLsFiyulQ==
X-Received: by 2002:a05:622a:48e:b0:43d:9d93:f5e0 with SMTP id d75a77b69052e-43fb0dbfd06mr144358131cf.4.1716957957873;
        Tue, 28 May 2024 21:45:57 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb16b6a79sm50044001cf.13.2024.05.28.21.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 21:45:57 -0700 (PDT)
Message-ID: <ad4e561c-1d49-4f25-882c-7a36c6b1b5c0@draconx.ca>
Date: Wed, 29 May 2024 00:45:56 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Alexey Gladkov <legion@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Nick Bowler <nbowler@draconx.ca>
Subject: PROBLEM: kbd busted in linux 6.10-rc1 (regression)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

It seems kbd utilities are all broken on linux 6.10-rc1.  For example:

   # loadkeys en-latin9
   Couldn't get a file descriptor referring to the console.
   [and it did not change the console keymap]

This is a regression from linux 6.9.  If I run strace on a working
kernel, at the point of the first difference we see:

   openat(AT_FDCWD, "/dev/tty0", O_RDWR)   = 3
   ioctl(3, TCGETS, {c_iflag=BRKINT|ICRNL|IXON|IMAXBEL|IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD|HUPCL, c_lflag=, ...}) = 0
   ioctl(3, KDGKBTYPE, [KB_101])           = 0
   ...

On a busted kernel, we get:

   openat(AT_FDCWD, "/dev/tty0", O_RDWR)   = 3
   ioctl(3, TCGETS, {c_iflag=IUTF8, c_oflag=NL0|CR0|TAB0|BS0|VT0|FF0|OPOST|ONLCR, c_cflag=B38400|CS8|CREAD|HUPCL, c_lflag=, ...}) = 0
   ioctl(3, KDGKBTYPE, 0xffceaebb)         = -1 ENOTTY (Inappropriate ioctl for device)
   close(3)                                = 0
   ...

A very similar problem occurs with kbd_mode, chvt, etc.

Bisection implicates the following:

   8c467f3300591a206fa8dcc6988d768910799872 is the first bad commit
   commit 8c467f3300591a206fa8dcc6988d768910799872
   Author: Alexey Gladkov <legion@kernel.org>
   Date:   Wed Apr 17 19:37:35 2024 +0200
   
       VT: Use macros to define ioctls
   
       All other headers use _IOC() macros to describe ioctls for a long time
       now. This header is stuck in the last century.
   
       Simply use the _IO() macro. No other changes.
   
       Signed-off-by: Alexey Gladkov <legion@kernel.org>
       Link: https://lore.kernel.org/r/e4229fe2933a003341e338b558ab1ea8b63a51f6.1713375378.git.legion@kernel.org
       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reverting this commit corrects the issue.

This testing was done on my sparc system in case it matters.

Let me know if you need any more info!

Thanks,
  Nick

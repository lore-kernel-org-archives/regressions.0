Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE7556465
	for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705689565; cv=none; b=vEojlQcVS9nDwWQFGByQO20ZlA/OZZnnT61I4jj3lGC5huPalWzYqRVgobylEg6Nz70q5I61/qn8D8NRGlzonxOHd3e1JkqS8s6g1Ja0vhOcIRyk2kYuZQddK3S3/rWa7+Tzhx2b0QEL4zMb+rSFNZ1uv7FM0ukwzD54e92vBQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705689565; c=relaxed/simple;
	bh=KPBYnvXs+bRh8VQUcF3cGEvDOy/UxtfQJY6XAedGMkE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=DsvPy6zhRujwlfhnsjuHe3/pHeAkktoBt7qo1PF7JieOeCaErtha50aalZA/8xDbHOt9E7Z44f/sJaILFlm+hsombkc64YKqAkF8oICesnMJ/vevhCM+hDXz7fl+IdJrnG3kPDCRhwUSXAoLZJL3ZLjdkcuRRqW/bt1gZYoC81s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=3Y6S6578; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="3Y6S6578"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7bee9f626caso15518339f.0
        for <regressions@lists.linux.dev>; Fri, 19 Jan 2024 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1705689562; x=1706294362; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3YqF9VDWGaS4VlQNR7o2au0lZg/1V8nOrIBJo7jDbbk=;
        b=3Y6S6578Dk+xrPmE3WZkKX/Bfkotn1S49mviEgCQyHyweKIBer1uh4gFXJlehqoMZe
         fzcecSYYdzREMc4dvc3U1ce+VakvekQsYo74LsB+vFSiN9fCPz1vpPcDAe0LAtGxg6pR
         jH7IvYwCheZ7zB12AldkYUuscUaXtUxzkrTURBVwk97K5UGt/Gnqn1jISQLN2+T8G/vZ
         kUFwJBdg/RC3xXOKvRAES9ZG6chFEXvX0HJB5NL12kUBGRN6mzOKdIOpKD+j91H4jEdv
         gjnRBQMb98vPaetClUN8Uu3M2TUR/2LY13X6UFPYID2LQ7C7QDS1UD4z+7w+vNpQCajV
         G/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705689562; x=1706294362;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YqF9VDWGaS4VlQNR7o2au0lZg/1V8nOrIBJo7jDbbk=;
        b=Hhs7n4t+Dt5foV/sbCVHfOfH+JbQsmTaLdnqZuf1FYVt7R7XmL0dfSX4oVioVjqN2X
         PdnVS+Ap/gR/6zi2GCVKKsqE9j224PSp4ZnHOy24Y7YodM0af9kk7KfYWIYYdsTmndqc
         si09SdAqUr/XakjvAm2nAyIL3xSp/s/atYZlzGPS+4dtGQBIvylg48ONUvA70tLT0Adi
         jjKBcyaajMoaIuRLCUb5pcCPLYtjONU2slbXPILNM2H46WzoF55BKp7kfeVGz4Y6OcmP
         L+9H8odXxouK8oh/CubWDmttbEx6yPpalUmoxO3SeNT/DO7tUvnh1FMpa/1Ioi3YMt2W
         aqnA==
X-Gm-Message-State: AOJu0YzKwzd9lcWyzLdHTfjCRwwqdPFebleIQVjK8MkHf/uyjqQWEkfW
	ttIndRlHBlfkfwd4zedVcGKGCBXXys7VfJp5IxrJhSYnd8vNLjjOmwpT1AONQ/E=
X-Google-Smtp-Source: AGHT+IG/wN6lTQv3q2R53igCCDQ0O7n9t9yzniyNiXLbO+u1nKR+CX6nGMNXevdX7msmrrgcagZdzQ==
X-Received: by 2002:a92:c549:0:b0:360:7937:6f7 with SMTP id a9-20020a92c549000000b00360793706f7mr570951ilj.3.1705689562493;
        Fri, 19 Jan 2024 10:39:22 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id bf7-20020a056e02308700b0035fabab7985sm5669677ilb.21.2024.01.19.10.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 10:39:21 -0800 (PST)
Message-ID: <05ea3233-20dd-4af7-86cc-de11ad2efe84@kernel.dk>
Date: Fri, 19 Jan 2024 11:39:20 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: LKML <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 avier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
From: Jens Axboe <axboe@kernel.dk>
Subject: REGRESSION: no console on current -git
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

My trusty R7525 test box is failing to show a console, or in fact anything,
on current -git. There's no output after:

Loading Linux 6.7.0+ ...
Loading initial ramdisk ...

and I don't get a console up. I went through the bisection pain and
found this was the culprit:

commit df67699c9cb0ceb70f6cc60630ca938c06773eda
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jan 3 11:15:11 2024 +0100

    firmware/sysfb: Clear screen_info state after consuming it

Reverting this commit, and everything is fine. Looking at dmesg with a
buggy kernel, I get no frame or fb messages. On a good kernel, it looks
ilke this:

[    1.416486] efifb: probing for efifb
[    1.416602] efifb: framebuffer at 0xde000000, using 3072k, total 3072k
[    1.416605] efifb: mode is 1024x768x32, linelength=4096, pages=1
[    1.416607] efifb: scrolling: redraw
[    1.416608] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.449746] fb0: EFI VGA frame buffer device

Happy to test a fix, or barring that, can someone just revert this
commit please?

-- 
Jens Axboe


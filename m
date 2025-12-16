Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2DB330655
	for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897756; cv=none; b=g8FaFZo/MQaXZVeqSWH2T4ZciHL11t98Oyota64St02vjsd7zDfamH45Sm4MXgXWmFYTK+eNyzlAdBkM6gi6aPbljvL+XVaE+3itfX0PCOJVKoif2D1PeIGLQRWNzijLqhenjYkk9n5/qsYOGO1einskXekvfrrw3ynERSYN6is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897756; c=relaxed/simple;
	bh=P5EatezNq4BgJDiRy+qSnDLhBpsRdk6obTP3oqH4CHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHvmCxpnFjz0inFEU74YEwrSE3wq+UosGs1EfJF1tdXWX2+/++gz9tW1jpHOjALPyP/Ojx2KOzAvyKIgSWj6jhJamyJwYLyWsrZpw4R/I1laX35bjEaa5ZI+5kfYXlbzAs4E72Rk4RIiQWT941ExwUN7PHLX0IL1x0SHTinxBNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=3Qp1iAIV; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="3Qp1iAIV"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-88a367a1db0so34974466d6.3
        for <regressions@lists.linux.dev>; Tue, 16 Dec 2025 07:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1765897753; x=1766502553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jrMcbVCU0QysEyyCI8MUU0ym/IVFglQ8rabaf9/So5I=;
        b=3Qp1iAIVGEz8lD/IiCbaWTVWM3479/sBZSFdsB9zGwQjLNSO9PdIVLUP+TSPIM81gI
         l0L9x7FnfX/tXENuRFEKbGogqEJUDWjGA3oLlhOChAjqncyi7wV3TX/BqmrplDHA5xy4
         FYvP/G8att984TAismrO1G56ODyZcUGCGBwZlqKcrcNv518KQkQ6pILgOjRq1r0qLMzN
         yNBszDoJepSQ9MbMKr/vziccU18dqAb4S3EAd0JYnUse137aXqGIwiOQI8Wv3H2Fn22n
         LUnRCB0Mp6eGMtoQ7zzqIicMLNMJ6JqaG2F7pKVR4zG8xm/aC8vNvYldP/bIobWDEqJK
         NURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765897753; x=1766502553;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrMcbVCU0QysEyyCI8MUU0ym/IVFglQ8rabaf9/So5I=;
        b=al0XUl3a2B00AyzJxu15mfMujv4etHR1ni4ggk7JyHxPj4UxrCnBIjQNMZTVz08MeX
         W18BM/dDR/1yd5sPKkiIC0WV8RaOtjkSBnz50lZIYtwaQDz5nw5EDO2Wr8YDDNNcR1l4
         iasFDlsZtqkebd/kgs8X3YXAxlyzBiC5x7cyi4s5Yo5z2iDQd1jgOX7QLsxL3yGsB28T
         JhATBS8JY7NYTd+qkIJHHDMQkqvKhlMwzTBVvv5G0H1KMC7t3xxtaUSF8kuORTIRytUO
         WHbfBahThLJLByqLPlsiqkvhmMgeNPzfZyl0UOptVWNUSK69gwP8D/WTvMf2nQ9Nf4M1
         RZGA==
X-Forwarded-Encrypted: i=1; AJvYcCXM+XhKjlzmjO+YsXR3MTJwCRmYI3lxY0iStXIMPkXVNCruuAAQt4B6PXYtX5z26sJFy0KqwySVLnqSUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzRGp22McU+bpSp3/zMvTn2MUXkd+akFdbwjP7Y57TscIW7v4W
	kMImskxAb3mfWVtqC+wqtONBX7xibWtvNsA4toIvTYzadZnx5s+hnqU3u9yMLt+5xik=
X-Gm-Gg: AY/fxX4GBJdLq+prdFHgdcEr8isAc2YOFhEyEAlfBGz5hu9EXUP0RCydKkz3ondKs6b
	tBZuTjpJsLnkDhlGJoJkg9nhvSfLA2B9CqPsaOMfqG1BbktyU5vLDrPmwqiBCed5ZsDNZZHHyEs
	hLL5SFUb5fwMh470w7i1buWSmsRpeYKS1Zt/nx7LQevq+q0bXjD//dejuKWsyjcDY5//6pO2StW
	F8wIyY2zFc8RAlnXSQ44pS/ke4AbA3YRBozwf4TbKk6uM2snoWPLxOjxZopVSB/jSwZxdfSsxtI
	U4Js6mGXYJAqDedYHjOwBX2xNCDEi6m/kpHoYgbvDFT7Z4f/9tLVi8OFZcKDVS3UwF3xW/E5Skl
	rkQGSrBa5dXItvQkHwtZkHEabDjwyE0+mKjhalmxNeIV8XkkXalWXEZqpR9jjH9LtICAN3qIn8p
	Cy/FbH/5YAFI42/ca/M5+RQ2zWre/Iw/BLYCwm9zzk
X-Google-Smtp-Source: AGHT+IEW3ea/jO7lBPSQ+CsTkd0hRgRRgaNgvTaIJoUUggk99zhFWx2fuRHPwk2sKowsnvyuNmOmPA==
X-Received: by 2002:a05:622a:581b:b0:4e8:a0bf:f5b5 with SMTP id d75a77b69052e-4f1d062a6bfmr207842641cf.73.1765897753249;
        Tue, 16 Dec 2025 07:09:13 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4f345c2e0f7sm15891281cf.21.2025.12.16.07.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 07:09:12 -0800 (PST)
Date: Tue, 16 Dec 2025 10:09:11 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Anthony Pighin (Nokia)" <anthony.pighin@nokia.com>, 
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	Esben Haabendal <esben@geanix.com>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] rtc: interface: Alarm race handling should not discard
 preceding error
Message-ID: <g3phtogna3a55vzah6olpxekdcmi322q5lzzwxwq5za4oi4plr@js34hr72bemi>
References: <BN0PR08MB6951415A751F236375A2945683D1A@BN0PR08MB6951.namprd08.prod.outlook.com>
 <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e7450d-d842-49ca-8219-a995c8ce8bfe@leemhuis.info>

On Tue, Dec 16, 2025 at 11:51:30AM +0100, Thorsten Leemhuis wrote:
> Lo! FWIW, Nick Bowler (now CCed) reported that below patch fixes a
> regression for him caused by the commit from Esben (now also CCed) the
> Fixes: tag mentions. See "hwclock busted w/ M48T59 RTC (regression)" for
> details:
> https://lore.kernel.org/all/2t6bhs4udbu55ctbemkhlluchz2exrwown7kmu2gss6zukaxdm@ughygemahmem/
> and
> 
> Nick, could you maybe provide a tested-by tag here? Maybe that would
> motivate someone to get this en route to mainline.
> 
> Adding a "Cc: <stable@vger.kernel.org>" would be great, too, as Nick
> encountered this on earlier series, as it was backported all the way to
> 5.15.y

It was backported to 5.10.y and 5.4.y too, but only after I had reported
this regression back in October (and I guess 5.4.y is EOL now).

Tested-by: Nick Bowler <nbowler@draconx.ca>

Thanks,
  Nick

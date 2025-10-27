Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC841E49F
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 16:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761582969; cv=none; b=AlXYvzz3WiHmro5v4vIpVtpMjHLE1MIrwG/WkzLmJNT6NSsulCx9esfft5bfHPAfPnLg4dLIhGBHklnpt7tPwvX0rlMv031Bw5tqvUzH1qntaAgDSNJhJBKvy+R3N1qPex+PdMcWuTiTo7V7bYz/+bMenWL/mV9lZvF/6HwPOGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761582969; c=relaxed/simple;
	bh=SQivHcMNzHK9+oAN6EscabpUgy4g0lSxLUmswuuPmJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg1HytCR30YjdqyxBSKu5I7xo7brIpT7IktG+itmhucKpYklguk3ZIjes2RzyvRLFKRV9rqjFkxH/3ULEXE7DZjPsQXxwRU7zXOE3iPGisMIbF3230MJUwS2gguQ0u3Cu3avwXMKP4SwgjUrzpmRQXSzqNCteeTmbFx3YAIMIiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42702037a01so920388f8f.3
        for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 09:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582965; x=1762187765;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k32sxT1kGp4e54c/OGW8PVJk5ZqsIMXt+4kbl+LaSy8=;
        b=S3fb+vyrrasMn8zvHITxADttYHlzfa4vVywE0ZSRC9HmFhl8xy3VhJk8yaNrQjgEe2
         E75nSUHMbh3EQhNBNr0V8wkFsLibWU1zNgGWrRz9yYFEIPg7l5vZ1vKDId4Km4K4POIK
         UodVHO7jSoZ2P/mEkqaUY0dPnCvxpGFx7B2NopAyFwiaVJ3d4u/5B1OMZebK89PmO2lZ
         2WByWFNQ9b/JNfNrGZOQviZdEbYpRZhO3EYS2U+pkpozxGup/bkTsCfStgSlVFCx6sze
         QEVzCsyqj7vYr7+S1zfZj2f/heYWzt3LUt3uIGFkovrgnHPac16oN3f6AWiqOLLBka44
         LPZg==
X-Forwarded-Encrypted: i=1; AJvYcCUNiGk41BgvP44msgx6yUQ4VfmdLw5QAj0qXOFX+3HCATDG75DwH4B02a/malkWz63j4MYakW/ad1IjLw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx13i8QXxdtSkRqLAR/jmDNU5Azfdc5JeaWm9lix0svO7YXFZ0X
	ljkucC3cJ9XoiKZ18LfMxFSku/Gi9BnSX0+sRHtH/ak8WaZhz/ZmydMg
X-Gm-Gg: ASbGncsFZnSl2FfCVVUxwy2PsxwrGQc04c2TPAGol8xwMZwLG1uHEGKrrOxsRLatpf6
	Vo5OzO6zymd2axiKd1BR5jPoX79OU6FTaO6sEYTH5mBwdUQVqTcwms4z/bGKAggBsoqlR3cfjBT
	57r0Gt6njsbV0JBlIao/oWM5uLXcRMd4EPuge28YetqRRgQbOmTvJ4RlFODDK3eaAPxrx6AzgT2
	paKUGA/mPJnFMd87gCeouzH5Uk8ETxFZQnejG4241a0tW6OwarK/Yl1CjXg1i3T88I6ZNhIFMsA
	z3ajphnlm8lkwpBR5EyO5ldmG5JVbb+u5QO0V8uFnQXSl9CU1is8O5wSH9rs4pQ2H/t/yoJMRRo
	YnXnkgWOZ1+ljfm8RgWkCWJveskVnJho+I2syu+GzTx5rrcjXUI1LcS6me+fJITHcAum5u7OZDU
	/twKr/Gzp2SneYfoCrPEtJp4fGC5aHzDIn9Q==
X-Google-Smtp-Source: AGHT+IERea5ccVK/c9QtDIaqZ84IicwNUcsWHZZ5WAz7ft1R6EzSMQqv7ngKFW/AyLzb21fQJ2137g==
X-Received: by 2002:a05:6000:2382:b0:425:86cf:43bb with SMTP id ffacd0b85a97d-429a7e7212fmr175929f8f.5.1761582965256;
        Mon, 27 Oct 2025 09:36:05 -0700 (PDT)
Received: from pixelbook (181.red-83-42-91.dynamicip.rima-tde.net. [83.42.91.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm15211419f8f.38.2025.10.27.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:36:04 -0700 (PDT)
Date: Mon, 27 Oct 2025 17:36:02 +0100
From: =?utf-8?Q?Adri=C3=A0_Vilanova_Mart=C3=ADnez?= <me@avm99963.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, regressions@lists.linux.dev, 
	linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] Intel Wireless adapter is not detected until
 suspending to RAM and resuming
Message-ID: <fez2defptc57azalrjf5urjwvihnfsn6imxmkflm7evq4wye5l@6p5pqp4ofgyl>
References: <149b04c5-23d3-4fd8-9724-5b955b645fbb@kernel.org>
 <20251020232510.GA1167305@bhelgaas>
 <aPc4JpVyhCY1Oqd-@wunner.de>
 <zmkurgnjb4zw7zcg6uucbtvuratxlaau5lvhkgknidpjz7vnb7@dnsyjbrqtvqw>
 <aPj4kUglHgBm4uAt@wunner.de>
 <aPkD-cECjlXx3kJP@wunner.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPkD-cECjlXx3kJP@wunner.de>
User-Agent: NeoMutt/20250905-dirty

> Below is a completely untested patch to force ASPM to the
> intersection of the two link partners, thus fixing incongruent
> BIOS settings.  Does it help on a kernel with 4d4c10f763d7?

Unfortunately it doesn't help--the WiFi controller is still not detected
at bootup and S3-suspending fixes this. I've attached the output of
dmesg with a compilation that includes the patch you emailed us here in
Bugzilla:
https://bugzilla.kernel.org/attachment.cgi?id=308849&action=edit.

I haven't had time to test the variant of the patch you shared here:
https://github.com/MrChromebox/firmware/issues/786#issuecomment-3446469391.
But I will do it later today (Europe/Madrid time).

Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E43F412C
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652398; cv=none; b=crT28ZVSzVmqa8rV5edAINrUAbHj1UC/qJds3IwT57gUC5DgpYSC1ORWYVbOdltBqYCNizi+t4PzRahpQaDq4Mz82Yt8BWwhMTcZJp8b+133/yA0+EKZiOgglyUCW1owOYsJ38+p6+JskXA941b/YSdb7N/ciEZZzB+bwUsCtXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652398; c=relaxed/simple;
	bh=+O4TG5OTvpzqzT/cUA9OzfVxWnNFyW0F+ybzoMguOEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iITj7iOzNpgzPjL9FgSYSLqv/pXUjYNqP0rK64/0hYgXAiiewIZYRYV2Sl1GDF9CMQ6JxHbqd9RcCQLRWd72CbPNArz3nwbdcxR8Pz7QLJTzuW7FzNitDaIXYDMY7mQFOlZczoviXi/mwpPlpkPsM/ooA70Nvm5ONtCQH/cQe7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZ+2gCSy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ+2gCSy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5655cc850so50114105ad.3
        for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 03:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787652396; x=1788257196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lV6nQecXjHtcQsqEmzr+clL9T3RLWY/CJqTB6zRiV+8=;
        b=VZ+2gCSyJVzlt7JCkq+heQIrs93638eXIpgk2yRvN67qTdiEyVFhNdTaf21IAhmXVp
         SuOAL4liMOwqu1HHU6SgstuzaoofkbRnQ1BRzpYcSm4oNlBXGiHsBd5Cgw7Dtxueaok6
         j2Zlg6v/Y8z8MV/A0nfHBrmj+fMiCvsLmnvhLGVWfDa+F36dr/H2l48shoCG6flWUpcY
         svO4IjDnQYed50Hd8PVsESS/pKP06jFEW+IiMJt4+dLWM1llgWKewkNA6iMnMFt9A+Q/
         xFh6gnUQL+Sq0IQwh+qKwNpA4Qz4NsNV/OOyx6zHJGe/F3O/+6AA9CjiiwqsN3zTAgQI
         eqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652396; x=1788257196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lV6nQecXjHtcQsqEmzr+clL9T3RLWY/CJqTB6zRiV+8=;
        b=l2vb72pgZy0h2EvUwO5rNsqFiygAfEFpzk8K+32TqngYLMwnopFVUesIEegKmfpYTi
         vnn67fd3a6+aMQaQ3AYZi81m7xLYkToKWAoIrZQuMwcYad8MECe8ikr27j/TulVkALHD
         uML6MRTv12GTlcGBlGMW1yA/vac93u2irweLTZuq86TYkus+TXx3BsQnnzu9RLKUmm9I
         E9NgpuRAFD5vEh8f2LB545ukO1oJBf/0BL444vjg56md2c52o9+Z18h2t8e1ZWXKahFp
         JrbOAXiKkDmUSbEQYgBABtM2sAZOEPOvj2A2Hpk2Qjx7TI2CobBxzo+gvQpPW7PDhu/J
         rdAw==
X-Forwarded-Encrypted: i=1; AHgh+RrZX075BcU4MHg1rumyrMN13wtrQrDh27c7kEzbeDI+8AaY4133txNohTTT1X7njewa715OEPvscuGjVg==@lists.linux.dev
X-Gm-Message-State: AFuF++lHqW5DUfi9lyTJGe7gJrjfJFZievgu62DDdKCOnc7hxEwQt68/
	HUBfPWSZE5BYw9OnJjOZLPmYfvmXcLCLrXtFD36+FDpciewhqEcBAb2iZWBQrEWZ
X-Gm-Gg: AR+sD11Ef22w/EupquiFCX2ejAoJ2YBIeeHTB9OmftSTgWCDiraZvoPsK3wRW5h3hA+
	ersEmOOPB4lZnuzCo1kGuy9NYheIBeup0Quu96gtuknVbg94NAfyLsDlPeQS6GfpAchHrVt+4iL
	4otk0oBjxgq4WwkNmEWQ+xb1uaWqGQtptxr4phzaHn/mHkzd8BoVCJo1ItcranJcP1hDHAeOc2r
	CVHaD4yoznJm3LeFIl1EH7WIMZByYYv0LVIwW7WC2t1m9dxVBPpiEm77lQG1EN/si2j5eNQYUuW
	fTZqD9mV/CXDR3+H1P860bk86f5KK6GQaY4ws7IvAhnST3qEuWh174YXFo8GVS8hLywvHKV0AyT
	Eqf0AgKT5iIjQROy1e0JcP3SvySzfkai/z26pFGRk1TwWuePMQYYkV7GqVi7npvYrwyjLWj7yXL
	JmQAWr1Cygm/pxEwqpCRh4d21xYgKWxtVi/OeCf1Cow7cAAQfvC+2sW037XqMYq/yNFjhP+eJa/
	BRa1OoAWADW/QHfORVY84Top2D12r/O
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d64b0e2c7fmr671003895ad.14.1787652395985;
        Tue, 25 Aug 2026 03:06:35 -0700 (PDT)
Received: from localhost ([2409:40c4:101c:e5a9:a28f:e499:1b07:43b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f8e2a730sm37287178eec.0.2026.08.25.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:06:35 -0700 (PDT)
Date: Tue, 25 Aug 2026 15:36:32 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Mathias Nyman <mathias.nyman@linux.intel.com>, 
	linux-usb@vger.kernel.org, regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
Message-ID: <ao1ovvdPAy6n_F7I@eggarch>
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com>
 <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
 <aosGtkE_diwVJJtB@eggarch>
 <20260823174059.46fec036.michal.pecio@gmail.com>
 <aoser8dLytrwqBC2@eggarch>
 <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPyJwA8m_Xd2oyV1i9k+-6f7A-j0FiC97yXL=Ci8ZAErs5W4vA@mail.gmail.com>

On Mon, Aug 24, 2026 at 09:37:55PM +0200, Mathieu Fluhr wrote:
> Yes. As mentioned, I first thought that the emulator itself triggered that by
> doing something that the CPU did not like.To be honest, I barely play with old
> Android versions anymore, but seeing that I could reproduce it even with
> Android 13 or 14 made me suspicious.
> 
> I _guess_ Google implemented a workaround inside adb for version Android
> 15 since using this version, it remains stable for more than 2 hours.
> 
> But, in the end, the situation is that from a simple user account having access
> to some usb plugged in devices (I usually add my user account to the plugdev
> group and use some known udev rules to access my Android tests devices),
> you have a way to crash the complete system.
> 
> > Opinions seem to vary on whether CPU load must be present or absent.
> 
> On my side (and I am here only speaking about my TR. I don't know about
> other Ryzen CPUs), I can't reproduce it under load, and one condition to
> reproduce it is my CPU going in C2 state.
> -> I did a 2:30 hour test using several youtube videos playing at the same
> time on my desktop, also stressing the emulator with some 3D Mark runs
> (as mentioned, I first suspected the nvidia driver to be faulty). As long as my
> computer was busy everything went fine. But then I let it stand still for a few
> minutes, and it just crashed.
> 
> If you need me to do some further tests or experiments, let me know. I will
> be more than happy to play the guinea pig here.
Was this result after applying the small patch I sent above?

Regards,
Lovekesh

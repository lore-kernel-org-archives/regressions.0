Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C498C151995
	for <regressions@lists.linux.dev>; Wed,  5 Feb 2025 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738753233; cv=none; b=kZ/Uk4BSzuZDNqxsAuZfSryTBLi6yO2bd4SD4Zea564g3lisIblxTh0ljTq7vB14gFxPS7H00QJ59tZa7l3i1B/4puaj0stkaoXlyyuCyfHpXm2thqBZw2fJka/jKsl+jQKEz0+L2nieIJKJShsNPNfzVOyO2Ha43UHsvmwJ8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738753233; c=relaxed/simple;
	bh=ggnuHh5JOOSCJ6LLQ0zuX0132brvaETBrjf3g3m+GmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhPgJHRqb4WjfQwK65N9/IH975Nu7UXvq6hsiFqQLRAPlAc9j+TkohW2x7h9jUpVhmPe0mJhg9Bb9IIBRrtxvt00neWx4c4ud11bmU1UUI/X9UnLUx1CnWpiK0iatFWSNdurixEuvzKlszgAnT6zLGXNdgP7cecgUwTPLV27G98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8YUv1eV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8YUv1eV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab744d5e567so154583366b.1
        for <regressions@lists.linux.dev>; Wed, 05 Feb 2025 03:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738753228; x=1739358028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSjdJz/xDA8mb42ayTcwdNMNuepVYnt3TrZB/pvMUoI=;
        b=Y8YUv1eVLLC6IhR+KgOwucIDETRDzmtxZMoNqX7mhqDz69XYhTrW375vcrqkvPGkq0
         cy8zXtq9Ts7qpB7NxEqaYPQZJTrQ0uZk7Crqy2Rf2b5Wc54k6wuwiA/0BbN18+FAETnq
         cLrCjnmLcZdoZl8Chen9xcU4mZitccHO7iZOacXCM/9UzfVEP1zM+i4MJ78sZjNr1JNZ
         PzCp3/EH2WsqBnuX1mCiQUNJpPNzEmh4OYRjVNIwgVmd/iyzFZR85ehPgykCfgc/yS2y
         JmebuHMCojjiVoC1NPZieFCz83L6EBAD/7xN1C7kfC05HW3sKTicfeZ84PzAVgQxH08v
         pFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738753228; x=1739358028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSjdJz/xDA8mb42ayTcwdNMNuepVYnt3TrZB/pvMUoI=;
        b=B25spKx3kfMRrh/BUOImjDlMwFKqRQtNanjMqFjI8tCySUqRJa4avnAVT1cZRXclXO
         aO3zCRgpJY1EaXOqNLLetLm4fCUTQyfvgAGNk2StqI3DsNrLGAI0MbM44tSfAiZs4dr1
         tP9Iuo98y6aqlq1RhfebVqeyAxQIv/Ein/6OvRjcPN+oqWChaxxh0m0nT3L9W/dgiT5D
         V0gCRzITCzUHEXpUiCUtFJgdm27mCpKM0cRCFafAievtTj0akx1fJKi/iP7Y+ZOeL5l+
         dgPYMm9QecvqbzASSU2n6S2vRRqPdt4rhUoZZTjZgozspwuGoNOvfouLp1XxxxWbHn7N
         LRHw==
X-Forwarded-Encrypted: i=1; AJvYcCUELduQgyXBKcI5XB6EP1mXUgH1WAySwCRhRhZk3yznysr2y+LMYiFnFLGOGPYEeXPrMYT9U/EQRwJBOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydOXZ71syGNfWsu2/g2M0HNt5ocIQ9BYUZkL61vI0gltILL90K
	Y6nQPpBpeOMYpRcIpJ/xtBc96A4YTmLeDitQuEQ9w2tcIdHNjQ28
X-Gm-Gg: ASbGncuQX3PsYSmwYESLjgfgjrhIYRaW8ghtOgrBQ0dO1DPFE84fanT7fhlRXzhpHDx
	dv3EC0WrYDtakEUP7R0uyBHCdYRwVCJZ0lOnLdo3o5i4q8pS6PspuHsqZDNzYg5umOUD/5iyMbk
	DLaZTOXM4nv5Pjpa4fHelnvwX5jSfdzJjlrSr2jCHwqPdVTGa0B77Q40d4Vva9NuLMRYgld9MvR
	QYupwgCR/+10+EXEuvxgNF7pbfJwGdArL7T7IOsaijxwWAlDxRXcEh2FDzaoD0w
X-Google-Smtp-Source: AGHT+IEVVg0kE39/wjtj8sTo6fT9WkDtB7UWVHKKZ58CONt1w8Vq3ELLHVci1DsLegASlf42WxQH4w==
X-Received: by 2002:a17:907:d90:b0:ab2:f255:59f5 with SMTP id a640c23a62f3a-ab75d2a9fe2mr249002866b.16.1738753227771;
        Wed, 05 Feb 2025 03:00:27 -0800 (PST)
Received: from m4.lan ([2a0b:f4c2:3::65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a818csm1077061666b.6.2025.02.05.03.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 03:00:27 -0800 (PST)
Sender: Domenico Andreoli <domenico.andreoli.it@gmail.com>
Received: from cavok by m4.lan with local (Exim 4.96)
	(envelope-from <cavok@localhost>)
	id 1tfd8q-0000bq-17;
	Wed, 05 Feb 2025 12:00:24 +0100
Date: Wed, 5 Feb 2025 12:00:24 +0100
From: Domenico Andreoli <domenico.andreoli@linux.com>
To: Jason Montleon <jason@montleon.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"si.yanteng@linux.dev" <si.yanteng@linux.dev>,
	"pabeni@redhat.com" <pabeni@redhat.com>
Subject: Re: [REGRESSION,6.14.0-rc1]: rk_gmac-dwmac: no ethernet device shows
 up (NanoPi M4)
Message-ID: <Z6NEyCRHTVfnM1vf@localhost>
References: <Z6CfoZtq7CBgc393@localhost>
 <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <INKEBRCGF47MsjO5WHpLcf1OTcQHw2KG6_Ez-K9QiTwAnb4MRVErnxoUT1euX_o9oRrxUILDRDvlOZ7ezguCU4maUyvkk-UqU52l6xLsF8U=@montleon.com>

On Wed, Feb 05, 2025 at 04:19:58AM +0000, Jason Montleon wrote:
> On Monday, February 3rd, 2025 at 5:51 AM, Domenico Andreoli <domenico.andreoli@linux.com> wrote:
> > Hi,
> >
> > This morning I tried 6.14.0-rc1 on my NanoPi M4, the ethernet does not
> > show up.
> 
> I am experiencing similar behavior on the Lichee Pi 4A with thead-dwmac. It works fine on 6.12.12 and 6.13.1, but with 6.14-rc1 I don't see these last several lines of output as in your case. I did also see the same new error:
> +stmmaceth ffe7070000.ethernet: Can't specify Rx FIFO size
> 
> It looks like this message was introduced in the following commit and if I build with it reverted my ethernet interfaces work again.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro?h=v6.14-rc1&id=8865d22656b442b8d0fb019e6acb2292b99a9c3c

Confirmed, reverting it resurrects the ethernet also for me.

Thanks!
dom

> 
> Thanks,
> Jason
> 
> > This is the diff of the output of `dmesg | grep rk_gmac-dwmac` on 6.13.0
> > and 6.14.0-rc1:
> >
> > --- m4.ok.log 2025-02-03 11:37:03.991757775 +0100
> > +++ m4.nok.log 2025-02-03 11:37:17.249455484 +0100
> > @@ -15,4 +15,13 @@
> > rk_gmac-dwmac fe300000.ethernet: COE Type 2
> > rk_gmac-dwmac fe300000.ethernet: TX Checksum insertion supported
> > rk_gmac-dwmac fe300000.ethernet: Wake-Up On Lan supported
> > -rk_gmac-dwmac fe300000.ethernet: Normal descriptors
> > -rk_gmac-dwmac fe300000.ethernet: Ring mode enabled
> > -rk_gmac-dwmac fe300000.ethernet: Enable RX Mitigation via HW Watchdog Timer
> > -rk_gmac-dwmac fe300000.ethernet end0: renamed from eth0
> > -rk_gmac-dwmac fe300000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > -rk_gmac-dwmac fe300000.ethernet end0: PHY [stmmac-0:01] driver [Generic PHY] (irq=POLL)
> > -rk_gmac-dwmac fe300000.ethernet end0: No Safety Features support found
> > -rk_gmac-dwmac fe300000.ethernet end0: PTP not supported by HW
> > -rk_gmac-dwmac fe300000.ethernet end0: configuring for phy/rgmii link mode
> > -rk_gmac-dwmac fe300000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> > +rk_gmac-dwmac fe300000.ethernet: Can't specify Rx FIFO size
> >
> > The configration was updated with `make olddefconfig`, as usual. I
> > could not find any new option that I might need to enable, if that is
> > what went wrong.

-- 
rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05

Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B887F9C7
	for <regressions@lists.linux.dev>; Fri,  2 Feb 2024 04:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706849737; cv=none; b=p8Xrq7fbTm/ZIW7PkP5XHOmKueTMwBUlZGjmR43TGeDBv6JXALl4CQioHX3BpgDUSQcl6VwyTjYMF1ZA/3iI4AXKXEKv7/4v3kr10WrX1yaUCougFIBRTPAhSZ4pW+xYXMADG3uyhJme0AHGGepTBTZMWugWF+6bzYSsmFOzCS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706849737; c=relaxed/simple;
	bh=2kYlvhPgJrOA5JXv0UROVLU7nz5GY8Jsi12RfI9OR8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HHxtFIPvFior87ptAYGbqXxf1TDbwDF0pG/5asV2RnDONQipmLUfFI/vs6MZb7Spyq4xPwjzhKSsQgLF9easdfNIKNTti3V+t77MvtMzSvH6YePAVAmr/BQzsL8/yPYRx5E8x10ganuQDLyNul2xGTAsLLlNlOm7wptp2u+CSkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb4NN57P; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb4NN57P"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d928a8dee8so19650955ad.1
        for <regressions@lists.linux.dev>; Thu, 01 Feb 2024 20:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706849735; x=1707454535; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4F54oWj9ECEcH1NBGn7lQh9aozrsidT6aq0Ua0NYqg=;
        b=Lb4NN57PU1K9GzYeEPZrqadSIBWPx3CXKfo9WA8jRLsn6yBarFFtAXyCdJT//SMj46
         q1nUNM0OyUQZXkwJz6LCS867IIpU+7YGmWq9jG/rtpTPJY5e7wfc5gIUfuqjdh2XDlHh
         3ivC3KPYjnC6a2ARADu/fTzWLZK76uhLA+ytD3Xn/Jjwo3xWWoCPOJADh3GObJ8SiEpR
         +dNewVlR8P1F35qZfVEyGiTkhDAqChIzmChyESc8iANZpOY/rv5iPQ4emSuBY/jjDiiN
         eUW5drhZ7Gevm2WFK0OmNwUTXNITLX8VwcrXK7lhIRkmjNmcEIcnW8Om5T7ajI+tOZb7
         72Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706849735; x=1707454535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4F54oWj9ECEcH1NBGn7lQh9aozrsidT6aq0Ua0NYqg=;
        b=ieiF7TlJugFboNtSPCpaUg7DL2zAwtbbCICH+zAVG7Zj7kfZxEOlFR6O7i264qSSzM
         QpCPd15BqLT4rum5K/8RHUHRt/Imz38aEVMZ77mky/rgtejuY4L4aC7nhoYecxrSA9M3
         gXTKnULBO72z3hGeoZYKJq44EGTqETNBFElEHVdof7X23VblV7f5Eg5ivVe19oXY8FW6
         MQQzhcX6Va9CTLNBAly/M5Bhn6kfSl3uP03REI9tiFBS09Sn02gwFtciiwUVn2o6MYGy
         CrvCzMA3p0TxMtd4IA5LptFfqIcT7C/ZY3O7mbQKeikl/O5sVFc9WhD48FGV7GWgwSJq
         j6eQ==
X-Gm-Message-State: AOJu0Yz6ATqI36RAKvCNSYKsSqK94iOsvkBeW/9P7Pobsybf3T5cBWuY
	cnp0HSBHmiYmbvr34EMFBnN9/5m0NP6m4bE9/XaPDuABTumnXqWx
X-Google-Smtp-Source: AGHT+IFxTKQC2MJ/rQeUs8h6zf1wW5trleLfX/5jZSaf9XUEEDCY6HJ4yvvPM+IKBzY2imgzqKCTEA==
X-Received: by 2002:a17:902:f9cb:b0:1d5:8cbc:863c with SMTP id kz11-20020a170902f9cb00b001d58cbc863cmr1435468plb.27.1706849735443;
        Thu, 01 Feb 2024 20:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUuzGWXEriJLeKQmmTDmUTB7aZmUbOXiU2mC2rYxMsQ1toxMQW42aabv+jnoeuV3WboTI06ja14Lf5LXWKL2MP/qUlFg6NSF3VNQcbJVQ6SFX5/XQix/EDMWmmmKPkPFxN8YNsCU6chrqSUyQXyEJE/gHDUBO8n3hpqvN32qbMmK510/cx1nSbQX6EnBHbiT7Smi1Dk7lctprqdtQ==
Received: from google.com ([2620:15c:9d:2:c30c:2f35:dc97:44fc])
        by smtp.gmail.com with ESMTPSA id i133-20020a636d8b000000b005d0796e779bsm652708pgc.12.2024.02.01.20.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:55:35 -0800 (PST)
Date: Thu, 1 Feb 2024 20:55:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-input@vger.kernel.org
Subject: Re: [PATCH regression fix 0/2] Input: atkbd - Fix Dell XPS 13 line
 suspend/resume regression
Message-ID: <Zbx1xA5FK_c8EEmm@google.com>
References: <20240126160724.13278-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126160724.13278-1-hdegoede@redhat.com>

On Fri, Jan 26, 2024 at 05:07:22PM +0100, Hans de Goede wrote:
> Hi Dmitry,
> 
> There have been multiple reports that the keyboard on
> Dell XPS 13 9350 / 9360 / 9370 models has stopped working after
> a suspend/resume after the merging of commit 936e4d49ecbc ("Input:
> atkbd - skip ATKBD_CMD_GETID in translated mode").
> 
> See the 4 closes tags in the first patch for 4 reports of this.
> 
> I have been working with the first reporter on resolving this
> and testing on his Dell XPS 13 9360 confirms that these patches
> fix things.
> 
> Unfortunately the commit causing the issue has also been picked
> up by multiple stable kernel series now. Can you please send
> these fixes to Linus ASAP, so that they can also be backported
> to the stable series ASAP ?
> 
> Alternatively we could revert the commit causing this, but that
> commit is know to fix issues on a whole bunch of other laptops
> so I would rather not revert it.
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (2):
>   Input: atkbd - Skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
>   Input: atkbd - Do not skip atkbd_deactivate() when skipping
>     ATKBD_CMD_GETID

Applied the lot to 'for-linus' branch, I will get it into the next push.

Thanks.

-- 
Dmitry

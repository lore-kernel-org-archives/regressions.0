Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDBD18C32B
	for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923861; cv=none; b=gAQv8/0Eaz/lywCHiw8tg99ybe0QDuR2E7z4Hzulxhad/+C0AGn4F6iWqO7clK1bsZjIQ+NyFblETOtn6Hjvy3HJh+WBBG0aWbtMgnLY67OtFm6hOC0JhW3bXE7ouoBgVtDwaHna+AJkPkSajrqo4j6NdbCPxmXqKw/9BbQxhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923861; c=relaxed/simple;
	bh=wgIc0h20EUEkDuMIR6UAqBYfWu7EPDfLEI64i6LhqAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob5M5xPF5AIwsOJdXNSxKUDtimry1gHDiqBR7LeyOq4SVpj/22WEr6YaWC53WMUOhNiuoEpbr388mV5cMkhNJaTzNyyt1+GLfyqC88OEOf7SgLKc7LKT2QJQft1ts5b4Zv92y7nAwvUN4Wg8HRUc25phyGIxYj5yCmioVa/S1Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=h9O+lA0i; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="h9O+lA0i"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86a0b5513aso43206866b.1
        for <regressions@lists.linux.dev>; Thu, 29 Aug 2024 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724923858; x=1725528658; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgIc0h20EUEkDuMIR6UAqBYfWu7EPDfLEI64i6LhqAg=;
        b=h9O+lA0ixJPic7+nw+uDPJKVUM520dmceEo3rOTVU1CNcVjv1Iy1Kz7GYBRMgcARit
         7RhWo/lWS0lphcfL0r/F0gSvM2sRyudAESuHsRXi/bkhxrVZx3nvKgZZFpaD12X6xcbO
         1omtG66W/Hu/IE9QhgkX40Ax5wchGeUSkKNIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923858; x=1725528658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgIc0h20EUEkDuMIR6UAqBYfWu7EPDfLEI64i6LhqAg=;
        b=NWQOSu60GuNrnGPHQdsnGxqnmwd87wsa43QPiWbcJmS2ikzmKrNK1YANOxlDKPY+yi
         /GgcDEKb3ZKhNfeQZDTH4eeJ0dIFiEFBOLeV8uRXdjl/Q4nLUbvUvPiwwQEhMCC1VCm2
         csRCDCSGmrHL4PFXQPIgdgfg2p2r+ymOFDgLraRIP4c6fQiW/v/Q+8aQSQ1MgkE7V8Id
         Vv3oQIZA9Xhz2w5MUsR/nUH9eUnUqOStnUKCd9DO6U7CUsgDAPij7RyXEV38SMaDLqot
         NkqZ0RkSioLw6U20feCgVQ/y0GBpD87gl1SaQu2whEwgF+qkDFnE6ds/QMPaf0kivZka
         /QNg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhKbzvAAn56UttFn92+ZDZdMlZf5IiDKesvuU7gx7/3sBpDemRYnYBS8e/q1FkGCG5V4chYRw9Pcy8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgfHcZy55NE/p8fdncnj/5P3fsKbRXQTMgsYCcEvyxDX0m4JAS
	dBn/U2+kNUe0Oy7sGtu8Ebu2sEwzKqLUoPuI4dEIcSAdnESF29pRTmoQoclA259rSo6Dr5/AE1R
	skI4XVBqrgvD6x8kA4GwyAppEhcmRV/5LEY3Zzg==
X-Google-Smtp-Source: AGHT+IH3wOalvCTUmmNxL4d2BqWH9lL0Z711lP+HuvG3s42bYquFhA+L2zL3tvqbF0DSSmA0LWMWaMVm8D2V97MLcjU=
X-Received: by 2002:a17:907:968e:b0:a86:c38a:34e0 with SMTP id
 a640c23a62f3a-a897fad8074mr148633366b.69.1724923858101; Thu, 29 Aug 2024
 02:30:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
 <ZrY97Pq9xM-fFhU2@casper.infradead.org> <5b54cb7e5bfdd5439c3a431d4f86ad20c9b22e76.camel@bitron.ch>
 <ZreDcghI8t_1iXzQ@casper.infradead.org> <CAJfpegvVc_bZbL1bjcEbEh4+WU=XVS94NMyBPKbcHzAzyxM6_Q@mail.gmail.com>
 <ea297a16508dbf8ecfa4417cc88eef95b5d697e8.camel@bitron.ch>
 <CAJfpegsvQLtxk-2zEqa_ZsY5J_sLd0m4XhWXn1nVoLoSs8tjrw@mail.gmail.com>
 <CAJfpegtNF4yCH_00xzBB1OnPBHk+EP0ojxDPp=qCFVKC=c14ag@mail.gmail.com> <23a1d750092f4ae85364ee73b8efa1c7653db86f.camel@ziswiler.com>
In-Reply-To: <23a1d750092f4ae85364ee73b8efa1c7653db86f.camel@ziswiler.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 29 Aug 2024 11:30:46 +0200
Message-ID: <CAJfpeguKFPpGUvS17hE032hus9hV51NcTYu_+atqHaiGXLHvbw@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: copy_file_range() fails with EIO
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>, 
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 11:27, Marcel Ziswiler <marcel@ziswiler.com> wrote:

> Any progress on this? I can confirm that it does also fix an issue I noticed on Fedora Silverblue 40 running
> 6.10.6-200.fc40.x86_64. I successfully tested this patch on top of latest kernel-ark 6.11.0-
> 0.rc4.872cf28b8df9.39.fc40.x86_64. Thanks!

Planning to send a pull request with fuse fixes this week.

Thanks,
Miklos

Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD7A3328F8
	for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763654645; cv=none; b=gU1vGcVkBHff5+CkJIUHMKMOz6IuOEFJ4o7jDCwi+dLPUJzFQByM6lUgMDGiuy44S/L+VQThpPazX81l6sZDHus+A9kq+fOjWpK1lv46EAQFLwS5LspH26nud0HyWfL+TNW+2iNB86lb5678wJWwX/3MKC++jzfUW7TMgl9mAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763654645; c=relaxed/simple;
	bh=Qb9ji47YdqM6JQH3Sq66VuJDGcwTvIOYKKH+WPKDmE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqanCyKNZwF45eTX6OpGGLfF7ht0zqnBhoAUCVmnu6UdGRYiI4I3cR+53PeVFv0Am1fYqINOijYk1VDTrBy6OxPKaDx12lY2oClo5iSgntSktkiReI8PsWVwzHSB2ONbyGsMXNzn4Z3eQI8JvleADOoNTXYL0iDI+vkN3+k4MVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qb53c97L; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qb53c97L"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b72bf7e703fso174632666b.2
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 08:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763654639; x=1764259439; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KFVSiRsFKVCEm70VbQUdMygEFtu/siEtryQmrUxVK4=;
        b=Qb53c97Lgns9r/J7yeUWDb85yd6PWc8yLf5INq5F0BUYBkm4VSS7tifTSdEF8sK8wL
         JO+6lGPIDHo/XJsRL4VHf2VyXGv39TM64sAoS/9mdPSx3HnrRzg+7LiZFLLEj8ufFpoH
         OcsNvrCDpLFM8CqtmbotbZ3AQcandCN1tt6Lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763654639; x=1764259439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KFVSiRsFKVCEm70VbQUdMygEFtu/siEtryQmrUxVK4=;
        b=a4Y9N6I0gQ43XqjFPVd3N3D9WYB49/m84Uumi92orMWP3b1nUW+e3jxncJam5LyWmq
         y35pIujWSRiK8z8JW/GJOrv+nAB1CmAckqES9onQQHpjt+TYvYFqFljeYqBpuXuWWY0R
         xq9rLfDSzvoZSAtsHOJBxGGowWTAx8GHGzgJIvD3pDIFs6ZbCe1ATafBXOjeKbHbNUwK
         wY+GNk8OjOlCiZKDby5OWk+TL956KDYaSuAuFIEykIbk6ekBIEoZEwQkjXEzSmVf3qSn
         qS4zBBvz0GMUrXyQUYF90u5ZnZRoJo7P1mxcGPyLW/6omSs01nlu0vM8oCKmscSSvjMS
         nMzw==
X-Forwarded-Encrypted: i=1; AJvYcCW8VHHqbfEFgXOl478YDWKvYdaBzLuKYofBDdHVGBjIK6Xph6HYTevR75jRYnePNfT97SoU3rV/Vjdp2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmUfa9zEJPa0pcgqANVRAJqQZD06qArz0FkURsO9fBp4VQ/ksh
	FAcslF+h3ZtlXHLKWjMlMXfV6E6ZMJZN2anNVgaeGae+eBqUaTImk+B4RNqZXnAlrexTAqkzWEl
	ERjoS0F3u
X-Gm-Gg: ASbGncvykBxgYF+iLD6B3R8fAQgTWVJmpU3d28E1BmuSGPRpGQYIQPYxbTFcuOcoMOk
	5n1U6kiVgLOwkEWCkT1xFOSVec62Yo20pU4KzUqE35ysxUVn5DIBwTN0X/py/5yaeBZwj1Qkn5x
	WTwXLbEMVLOlEDOEyyrFQWJFwmwwZLKzzeLEHmcLYCL/UIZyfehNGyhVeTqwWE025/Y3NGMBn57
	4WcF01AxxceWAn5htg/bjJwxj3YqOtKAbHyGu8Wy1db7mu9iSEj5vEfBkn00P+FP526uHFtj4u6
	OzYocZqniSKHkBu2s+8DvnSlJbXUIdMT67SB/ZjyN36GysOoOxH1Le7Sc5aYShzfqasSuDmFsns
	KNAnAfOkKo3lLp9ty+z+K4R5e2+9mS0SNmqKvfJf1/kqH5mLiEHtxw+ce5iVonAtYOR0FCTfqUp
	SpIOBXleFvj4bwAeozBskZvd05op6YuFNoHxzZvSwwNU1HCwRT+g==
X-Google-Smtp-Source: AGHT+IEegdX1hUJ2PF9lc58Ro6yZG9yQDrN6mRuxD/kOFJh7mwIqdXXznMnWP3qorQFg6RragDokeA==
X-Received: by 2002:a17:907:7fa9:b0:b71:29f7:47ef with SMTP id a640c23a62f3a-b76550af2fdmr372692066b.61.1763654638854;
        Thu, 20 Nov 2025 08:03:58 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4275sm229801166b.37.2025.11.20.08.03.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 08:03:57 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73545723ebso197298966b.1
        for <regressions@lists.linux.dev>; Thu, 20 Nov 2025 08:03:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbR+SCKCV7p5iyfpbs9TZSyR/TBhZBOOrdx6gqbM7xQOmnXOSXicl/OYdTombJ7+74dj7B6ZIUpYnmYw==@lists.linux.dev
X-Received: by 2002:a17:907:3f2a:b0:b73:82df:7a3 with SMTP id
 a640c23a62f3a-b7654dfdf85mr459822666b.20.1763654636786; Thu, 20 Nov 2025
 08:03:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me>
 <a380d061-479e-4713-bddd-1d6571ca7e86@leemhuis.info> <CAD=FV=Xt58+WGK_j_TvTxpUfXrm-=Cec1-oodkuf5xiDGrsKuA@mail.gmail.com>
 <T4YKnjuw-ZdA4uQjGVxQh-vqahAK_69kn20zfC_8R45iOxbdjo_tlIDwP5rTUyjn3NVUHYhG09VO2ryFtfLtgptBBhfXggFNAD2CVAwPcjU=@proton.me>
 <CAD=FV=WDx-WcosBWf2yd3sLx5pEyjOgbs_Y5RBF=+b=0q3dBww@mail.gmail.com>
 <5rFwJreAVujrYXDGZZxW32PHa6HZ29PEP4R5-dqS9dbU3FI__qe3zIUx31TIHO_LjuURCSwaGucSFBPeXAjf00XzAxTzXbmf1AaY6neyQ3Q=@proton.me>
 <CAD=FV=UCnt3nUktRyzUDp1agDFp3ZJo=t+xBbLCD6W7Jd0aF7Q@mail.gmail.com>
 <5vLxmZlxKXfznaWPi2ndxyj90dJN1FML_fINz027uaJP2rZK_nQu_41m7WA7Gnc1yy_XLw8KMWF18Y_keW-qKjHy0BBOQl0A92QiY7Kg004=@proton.me>
 <CAD=FV=WRYYYB+G4-7y7uVR8QCEEMp2iRfmtsAa29UfyNCVD=4Q@mail.gmail.com> <YrzH4CVQLf1BjCQDuWEnQ5oxWGrsTge_CHmEViJEDklOFwbMEylpl2KnmeiG1EgCm62OKNFG1JRu_b2bOVUbZZOZQwcSNHbUO1gR1GiN1rI=@proton.me>
In-Reply-To: <YrzH4CVQLf1BjCQDuWEnQ5oxWGrsTge_CHmEViJEDklOFwbMEylpl2KnmeiG1EgCm62OKNFG1JRu_b2bOVUbZZOZQwcSNHbUO1gR1GiN1rI=@proton.me>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 08:03:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XUFEMAuLiFUR7pvPsWJP=_A=6=UGrFX9mobTV1M0gN=w@mail.gmail.com>
X-Gm-Features: AWmQ_bmns0n46-hrBsBm11ElrwzJB-TB74eWjZFHpGOhpLoxviwv1q2qGLIXbGU
Message-ID: <CAD=FV=XUFEMAuLiFUR7pvPsWJP=_A=6=UGrFX9mobTV1M0gN=w@mail.gmail.com>
Subject: Re: [REGRESSION] Bluetooth adapter provided by `btusb` not recognized
 since v6.13.2
To: incogcyberpunk@proton.me
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "marcel@holtmann.org" <marcel@holtmann.org>, 
	"luiz.dentz@gmail.com" <luiz.dentz@gmail.com>, 
	"linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, 
	"johan.hedberg@gmail.com" <johan.hedberg@gmail.com>, "sean.wang@mediatek.com" <sean.wang@mediatek.com>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 20, 2025 at 2:14=E2=80=AFAM <incogcyberpunk@proton.me> wrote:
>
>
> On Thursday, November 20th, 2025 at 12:16 PM <dianders@chromium.org> wrot=
e:
> > In 6.13.1, the following could happen:
> >
> > 1. We'd be running btusb_mtk_setup()
> >
> > 2. In btusb_mtk_setup(), we'd run:
> >   btmtk_data->isopkt_intf =3D usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM=
)
> >
> > 3. If usb_ifnum_to_if() returned NULL, "btmtk_data->isopkt_intf" would =
be NULL.
> >
> > 4. Next, btusb_mtk_setup() would call btusb_mtk_claim_iso_intf().
> >
> > 5. btusb_mtk_claim_iso_intf() would pass "btmtk_data->isopkt_intf"
> > (NULL) to usb_driver_claim_interface() as "iface".
> >
> > 6. usb_driver_claim_interface() would see that its parameter "iface"
> > is NULL and would return an error.
> >
> > 7. btusb_mtk_claim_iso_intf() would notice the error, print "Failed to
> > claim iso interface: %d", and return.
> >
> >
> > In 6.13.2 after commit e9087e828827 ("Bluetooth: btusb: mediatek: Add
> > locks for usb_driver_claim_interface()"), we'd add in this step after
> > step 4:
> >
> > 4.5 btusb_mtk_claim_iso_intf() would call:
> >   device_lock(&btmtk_data->isopkt_intf->dev);
> >
> > If "btmtk_data->isopkt_intf" is NULL, this is the same as
> > "&(NULL->dev)", so we'd pass a number that's very close to NULL in as
> > the dev pointer. Then device_lock() would try to dereference that and
> > crash.
>
>
> Sorry for the lack of knowledge on my part, but could you provide insight=
s as how the bluetooth was functioning wihout errors in 6.13.1 :
>
> 1. Is it because there was no device_lock() checks in 6.13.1 and is becau=
se of the newly added `device_lock()` added on 6.13.2 ?
> 2. Is it because there was `device_lock()` in 6.13.1 that despite being p=
rovided a NULL pointer,`device_lock()` could dereference and the bluetooth =
adapter would turn on BUT in 6.13.2 , `device_lock()` would be provided a n=
umber close to NULL which could not be dereferenced and hence the bluetooth=
 adapter wouldn't turn on ?

Right. There was no "device_lock()" checks in 6.13.1. The lack of
"device_lock()" caused a different kind of crash (sometimes), which is
why I added it. ...but I missed that we need to check for NULL before
calling device_lock().

-Doug

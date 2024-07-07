Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582615E9B
	for <regressions@lists.linux.dev>; Sun,  7 Jul 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720350919; cv=none; b=ax3cNk/Y/txUgPv1vuYavpT+mIxDAo6GBVoO76y+/Kcf618jGsgug4ygJYT/t5MmTHfKOGD40AdPfsB4mPrDXlJE7K/pdoLsH/FJ0HRJ5HIRUBIzZdPqub86WQct7Y+pCcjje6kMv2x6BEXZLLkkcCfG7yB28wd5Sg3HA1M40bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720350919; c=relaxed/simple;
	bh=GCiV83PkQGQBX0iCvr2E0PjQAzhoDidHblBBsoMp9Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cos5hHeU0xMF5vGDjnnmtS12NGPB7tHOhQp1LRyy4+5bGWIBZrkg3pZZyUPuebdnZeR8LFJqhG4hbxW7I2iIAJen69xDxVOESAGWwcDGFV9dcJHq/Uzeku56SBMAeoc6Oi4CueVEvcsMYqAUR4oEWlSpke9WaB5TXN6kC3C7qAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPxx5bR6; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPxx5bR6"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-651da7c1531so26319917b3.0
        for <regressions@lists.linux.dev>; Sun, 07 Jul 2024 04:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720350917; x=1720955717; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JEDaHctMDjTLUQmt8H4eKIsXIEH/NgBcNg9NnhklDGc=;
        b=cPxx5bR6pq3NIjQkbK5G/5GyoIQJm0CiT8uMwHS/0FKB4kPBQsy95Iz0iVfbqyrUiB
         sCJz9wDJ1wokuT/8QFBAGEtppGmMs8by73Ju4jv4zemVyj9n8N92Wd6OVp9cCOE55bK8
         zoPzHWWMb8RGD8h2ey3lqlZ6l0MZGOm++eIOVI6XjL/urgsg4QfoTZZwdijAatjXbtFS
         T4FLSLMphRElE/Jqpae+SeTO4h2zIQ0gWvUfKwHIv+/da40a9g7iBgS8z8LSq/OUakiY
         eqQ1S7poin9aMAwam9mIKKif2mfR7ljg+jDLsPn/ftgwYWqb6h36yq3Koj6LmXqBoe2E
         EUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720350917; x=1720955717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEDaHctMDjTLUQmt8H4eKIsXIEH/NgBcNg9NnhklDGc=;
        b=t27AL7vZjTRXzgHdvpBvidDVFLu8w9P6IISxOyhO/6yXNyTMuVEtNcx0iQonBME2PN
         NoqtlaS36aBYfJuifcjz54dxVn+iJGD0/1S8MNJrT0nFLpQwWNioKBPa5RSSe90Ksgb9
         H9gxkxQVuw1TZjtn8uRFq6zaSLtlMPCDPdtJCKSibP7H/m5Lr2aFiYn+ao6+7t4GjLV9
         pGhSPB6BvzSJJkZftmUnks0mynLjngmIU4PXaA3Ut3Wu8qFJey8CTlSVYyXZr9R9pYmv
         tyP0Nf+zhAJvGKf22JFxz/JwMR6Z+n+smVMdZWUdRamgZ2yArE1eXLnUUFlEdkfE/fC9
         ayAA==
X-Forwarded-Encrypted: i=1; AJvYcCXfhBJq2vudh+NkQP4sfW/iPUGcseYkaS8IlKOXN9BvcIrgYYaakNjId5PsG995TanjrEZS8ugCkVW0lsPqOIDtUJinBpsSGQG9b8U=
X-Gm-Message-State: AOJu0YwWetC0lgQP5X4MsIzchmNJGJ0v9cgO8+KQxF3y3kbH2mdhSZ/g
	nz8AMNht41B4F7VGJ81kBmLqVneAt9q2zXCxSaq+mJxwPgWPqDEvuGLQrsgEHT2C3PoIfBuJkce
	EQt40fFjo6qjU2lu/7/Gz8XvjUG0=
X-Google-Smtp-Source: AGHT+IF+cw2g6r/QOlqBO2ajneYgMMcCF8mdTACxJgT8VoYFfD/U+McKqqzQTSTWgFZrYRQtFjG8cHAyRVVKR8uPHCQ=
X-Received: by 2002:a05:690c:f0b:b0:64b:52e8:4ad0 with SMTP id
 00721157ae682-652d52266a8mr113145587b3.6.1720350917069; Sun, 07 Jul 2024
 04:15:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com>
 <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
 <CAK-xaQaesuU-TjDQcXgbjoNbZa0Y2qLHtSu5efy99EUDVnuhUg@mail.gmail.com>
 <CAK-xaQbcpzvH1uGiDa04g1NrQsBMnyH2z-FPC4CdS=GDfRCsLg@mail.gmail.com>
 <CAL3q7H63GexJexkDxSz9Av_s=XyYotJqLqjUubZmuU7vynaQNQ@mail.gmail.com>
 <CAL3q7H5fogJTfdkj_7y8upZj7+4dz65o-tKzyGf0WfLwm3nfUw@mail.gmail.com>
 <CAK-xaQaYDg60DizL3kJ3XKU5JD3kKVi3kecb2s18Po96T9tAHg@mail.gmail.com> <CAL3q7H6rir8w6ge6zDPXYFaBoLyHsbcApr9WXb+A1Vc+8RP77w@mail.gmail.com>
In-Reply-To: <CAL3q7H6rir8w6ge6zDPXYFaBoLyHsbcApr9WXb+A1Vc+8RP77w@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Sun, 7 Jul 2024 13:15:00 +0200
Message-ID: <CAK-xaQaDGR_x_HZ3CfTsguYQxWjUehKGSpapYLyF3wC=ofRB8g@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno dom 7 lug 2024 alle ore 12:28 Filipe Manana
<fdmanana@kernel.org> ha scritto:

> > Ok, recompile now and test!
>
> Thanks! Much appreciated!

So, usual benchmark:
    fresh: 0:03:16 [ 275MiB/s]
    aged: 0:02:30 [ 680MiB/s]

I let you know in a few days.
Well, does it make sense to add the option to disable shrinker via /proc?

Thanks to you,
Gelma

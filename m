Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE2B161
	for <regressions@lists.linux.dev>; Tue, 25 Jul 2023 00:10:07 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bb2468257fso25808955ad.0
        for <regressions@lists.linux.dev>; Mon, 24 Jul 2023 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690243807; x=1690848607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf+PzXduxiuJ48KWawZ3LtkdVEPJb3KLiKU+A4/q/2Q=;
        b=Nwak+FBzHWKFDHev4q7rUdCqtjOpRdeo8NZ7uewmPCm1t8Fc/f898eg2UPv/lkF2zT
         kUo19a/Fr1oVZ644KlIMpDycApZmVe0nxCdQxWqTiR18zd0heFmNDkASykhFTYzmMXcZ
         m3bhxyp1/xORSc64j9NKNMWSLgwhnyktIyzI890T2BoWTGMKwOx0EUoXaTEA9F1nB5m0
         p1rjyztq2FzyYVWtAwR4UqHPTJb5Q6AcmQ3D4YsVCZE1AmIDvTW7W6CYUO6aQlSzMrWt
         xC+CA4tXHhXqy7KNJlOx2elZlcY0cKA1bZJW8Ud7n++QdJPKY7Jf5FjpocKQUEfZIuzG
         N5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690243807; x=1690848607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf+PzXduxiuJ48KWawZ3LtkdVEPJb3KLiKU+A4/q/2Q=;
        b=Y9yzoQ4MyFRAbq3I6sB01IuyDQ0K/kO5xB0zbjk7sntwt/74KJFyCpqm7d/Wj11Owa
         T1SQ0TOwWaugOSBy6Z88tF9yssZVy/1Nh/ovgMasjcqCAbWAYVAu/D1Bt5Iy6TvUyn3t
         aDobdeyQ+5f0XFjcj3HZTEQbzonnZWE+ooVN9OUH8SJpXcz6xasQ883sMCbBdNggB6rN
         5fzt7Ye3qr7h5TFLhAoMYk7CqZFMpaer83LsIdUyPZQRBRosdil5U8I6ya7iU+KJ3ze2
         NYtAhgcQzILS7K96jgl42fW10Oms/siQIYa46Bqftw1O5BPZ0Up3QMF5V5/yOtJZ6jAh
         9s+g==
X-Gm-Message-State: ABy/qLYfPSyHz+FrwWsCqbb9lcz/mQCqvXQYEXs3JRF5sxisIh1m8Uf0
	rN/si3ArVZ0ZE3gVPoj8B1WLNS8NY5c=
X-Google-Smtp-Source: APBJJlFQDcA1kqMEZOG673r5dxMQmDtqfPe2bqvQzV4rQfkTn5yubhCV2ENLPI25inl8aF8V5TdnjA==
X-Received: by 2002:a17:902:9b98:b0:1b9:e9f1:91e0 with SMTP id y24-20020a1709029b9800b001b9e9f191e0mr7323365plp.41.1690243806657;
        Mon, 24 Jul 2023 17:10:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9d8f:da31:e274:eeb5])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b04b1bd774sm9570519plx.208.2023.07.24.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 17:10:06 -0700 (PDT)
Date: Mon, 24 Jul 2023 17:10:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Verot <verot.wrongdoer713@simplelogin.com>,
	Linux Input Devices <linux-input@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: Kernel 6.4.4 breaks Elan Touchpad 1206
Message-ID: <ZL8S2/Ujprk4KgzT@google.com>
References: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42bc8e02-5ee0-f1c8-610e-e16391e54ee2@gmail.com>

On Tue, Jul 25, 2023 at 07:00:21AM +0700, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> > Description:
> > When booting into Linux 6.4.4, system no longer recognizes touchpad input (confirmed with xinput). On the lts release, 6.1.39, the input is still recognized.
> > 
> > Additional info:
> > * package version(s): Linux 6.4.4, 6.1.39
> > * Device: ELAN1206:00 04F3:30F1 Touchpad
> > 
> > Steps to reproduce:
> > - Install 6.4.4 with Elan Touchpad 1206
> > - Reboot
> > 
> > The issue might be related to bisected commit id: 7b63a88bb62ba2ddf5fcd956be85fe46624628b9
> > This is the only recent commit related to Elantech drivers I've noticed that may have broken the input.
> 
> See Bugzilla for the full thread:
> 
> To the reporter (Verot): Can you attach dmesg and lspci output?
> 
> Anyway, I'm adding this regression to be tracked by regzbot:
> 
> #regzbot introduced: 7b63a88bb62ba2 https://bugzilla.kernel.org/show_bug.cgi?id=217701
> #regzbot title: OOB protocol access fix breaks Elan Touchpad 1206

Please don't as ELAN1206:00 04F3:30F1 looks like I2C-HID and not PS/2
device that 7b63a88bb62ba2 would affect.

Thanks.

-- 
Dmitry

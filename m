Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D732A610E
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 06:48:30 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2774aa96947so1315014a91.2
        for <regressions@lists.linux.dev>; Tue, 03 Oct 2023 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696402110; x=1697006910; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23AGVAWCx64NlSwPlvRbIMj9BD4UvwLfDZ70pzkv7wo=;
        b=HRb2t7EGq6P1Xh1zkGK+iY15w4B2W3QWd8pYFx9yRNo+ATSCg19IMu7qNYaf58ywtP
         R5gCy/7NK/6TYny86Yc5CsLTQDFb3wLn5ZRxAwN+RBqlHG8ojVPPuuIIRQouLMkRnpys
         sU64/dkMjsGEohB5A0curZNVbhomijeY1gAeHTZU5snAkbFqoSesrVKuJBiTOO+IYCY5
         jaXbZmt3uubJZlKAdHMvJsISD7o21zuU3C1Bmn5IAg2hrAqyaieoI3tNgNxLmIcofA8i
         52I+How2VWPo4M9icw8kDZzCd0TbbPDwmKMyAEnAuGkJtsEX+lJFp7x8PlabyK/vI/H/
         Royw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696402110; x=1697006910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23AGVAWCx64NlSwPlvRbIMj9BD4UvwLfDZ70pzkv7wo=;
        b=RaQ9YyB4eBXpD/D3j66m5TWTroaQqjm2bOLN33nBoRzAn02rUL6WKgLiOqJFTDcAGO
         6bREHOMT+TzAkaz5Io1P+lbKs6XMhr1XcT36Uq5OeIu6zZXUqrrlZe43/CS54wZFEboq
         tNVWtuxB72hzUOsGvrscFyebwxfgYjpseL0A4X1pcGuG0MBikyKXnIg7fFty6NUVdd4N
         yqQMmPO09HnQHOP1mDJt55cE7vmxFvkh0341Ga3t/oik9GvY8J1KmoZlk8644nwgh3D5
         NPftRS33ueAvEpYWz43s6PhNrfcbkbH+ueE8UEpu2uhWgDuSr4QUkazvwnQ+cH8Fitb1
         eQ0Q==
X-Gm-Message-State: AOJu0YzDAt9XZ8MwEY1jOJhp9Q77rnXuWbjpoC+xDUjrKiQ5ckmMcwlR
	xrWi1j5R5QD8oemllIOTOZl2A7zQT/Q=
X-Google-Smtp-Source: AGHT+IGXW/NMBPkNnO9VKm//8nQQhh5XUC2SXJXHjrF4PYjXr48wJqNEjYrN84A+dyZZwJ6Yt1jS2g==
X-Received: by 2002:a17:90a:e60f:b0:26d:2d77:da7b with SMTP id j15-20020a17090ae60f00b0026d2d77da7bmr1396480pjy.6.1696402110051;
        Tue, 03 Oct 2023 23:48:30 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001c7373769basm2789290plo.88.2023.10.03.23.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 23:48:29 -0700 (PDT)
Message-ID: <7392af01-af99-4b42-b491-eb4f56120bc1@gmail.com>
Date: Wed, 4 Oct 2023 13:48:23 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: ThinkPad T430 (BCM20702) Can't Detect Bluetooth Devices
 Starting from Kernel v6.1.0 Until Now v6.3.1
To: Moh Oktavi Aziz Nugraha <moktavizzen@gmail.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 avisaziz123@gmail.com, linux-bluetooth@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAHCNbp3ztCcp31JdVYuxy+s1qXaa+Zy74eGJmfPmyrx_6Wjhhw@mail.gmail.com>
 <ZK32l3yQEMdmttOG@debian.me> <ZLyL7+IOqRSysJrl@debian.me>
 <CAHCNbp2BhCPe23XyM-x24NN=tcrhsETWy1eUMXHzTBXp3yu=qg@mail.gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAHCNbp2BhCPe23XyM-x24NN=tcrhsETWy1eUMXHzTBXp3yu=qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/2023 11:32, Moh Oktavi Aziz Nugraha wrote:
> hello, first i would like to say sorry because of this very very very
> late response. After this problem report i had a 6 month internship
> (college program) until december, so i had to switch to windows
> immediately after the initial report.
> but right now im writing this email in Fedora using the latest kernel
> and the problem seems to be fixed! my T430 can detect bluetooth
> devices fine right now

Please don't top-post; reply inline with appropriate context instead.
This allows readers to easily follow the conversation flow.

Anyway, telling regzbot:

#regzbot resolve: unbisected but fixed in v6.5.y

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


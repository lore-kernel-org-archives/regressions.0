Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E52FB2
	for <regressions@lists.linux.dev>; Sat, 26 Aug 2023 20:33:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-31c479ede21so1600397f8f.2
        for <regressions@lists.linux.dev>; Sat, 26 Aug 2023 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693082032; x=1693686832;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuBXyxO5VRkfmiSduOQc0d8U4bHaBkRBImnyuV2r9Co=;
        b=QZKpKZ8XfxRk5j/u4lAb7sRP3Z8jWkHNCXx8038eeYYxaiQglIjMwYu6ocFlrt+jvr
         fvRiEIy4qmfJ1tCd1JHJAL34nBoOK+I9zEo3eN/hBkanhWrPXYQMMaqXWWprmmhhng77
         ZpOIx0Uo2ffCZV+LLFIMqfaUv0Vb/TzVv3zHcabxIY5rgoAyGUxZz2Sn+V2ePM+cPkiI
         fTwY6l7iBC0iZJaKT7JoylazqP/l85FeHMJstZwwyLuI4j0dGKuid5Q2IXflQmZG5gwx
         tM3T7rJ47xpckgLqhvc3Si8P3y886eVdttum2x76mPlHgFGVrCYo4p4k3jOqYiewV4K3
         b2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693082032; x=1693686832;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uuBXyxO5VRkfmiSduOQc0d8U4bHaBkRBImnyuV2r9Co=;
        b=cur3Ip2ByqymLMU28uWLVhXXSL4qOvUX7P1TBkXFeUsCNKUe8fA4YysOAWf2xKFU6C
         eTKptHDSUc9OXUYDmssXhZIu68XN29dAiuzZfnNCDYsZtnxMEUllR65COC0LyJjMUIaU
         WGUpdp+FHUBb8nEmUW9Lt5Z970A795JOczH7r8oWqceKz4et7HQfbgRc8l7K2hWjFFSC
         EAS5kNRY7IsT2ch0jiAf3G6Aycko4oWWyEB9VGLk3Fyla6XX1y6ckhiRRCkc8AvqgZvp
         /ZKK4Ow7Nqzrj1NMiF7kjdFbmiQX5jWu5K/Fy4jODjGrRYFCkr77QDaIdpabaV/8qxBM
         w4nw==
X-Gm-Message-State: AOJu0YxBah3c8GRCgjfqAPDuU9JOFbp+CXfDIof+GJ/r89A2qWhuyee5
	gYzVkII+lkYycSBLUfURr8Q=
X-Google-Smtp-Source: AGHT+IFQrR+4XWYPtAmULJFnBb8HYuTxvfE3S2scsw+tj3UMmIHvkqcn2OBdi7ehLU5tygHUXsLvLA==
X-Received: by 2002:adf:ce02:0:b0:319:6b5e:85e3 with SMTP id p2-20020adfce02000000b003196b5e85e3mr14788255wrn.71.1693082031420;
        Sat, 26 Aug 2023 13:33:51 -0700 (PDT)
Received: from [192.168.43.213] (na-19-75-36.service.infuturo.it. [151.19.75.36])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d6144000000b00316eb7770b8sm5802171wrt.5.2023.08.26.13.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 13:33:50 -0700 (PDT)
Message-ID: <aa1649b6-b7a8-4fbe-8356-2c856951e283@gmail.com>
Date: Sat, 26 Aug 2023 22:33:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Luca Pigliacampo <lucapgl2001@gmail.com>
Subject: [REGRESSION] [BISECTED] power button stopped working on lenovo
 ideapad 5 since a855724dc08b
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linus.walleij@linaro.org,
 mario.limonciello@amd.com, Basavaraj.Natikar@amd.com,
 Shyam-sundar.S-k@amd.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

since the commit

a855724dc08b pinctrl: amd: Fix mistake in handling clearing pins at startup

after boot, pressing power button is detected just once and ignored 
afterwards.


product: IdeaPad 5 14ALC05

cpu: AMD Ryzen 5 5500U with Radeon Graphics

bios version: G5CN16WW(V1.04)

distro: Arch Linux

desktop environment: KDE Plasma 5.27.7


steps to reproduce:

boot the computer

log in

run sudo evtest

select event2

      (on my computer the power button is always represented by 
/dev/input/event2,

      i don't know if it's the same on others)

press the power button multiple times

     (might have to close the log out dialog depending on the DE)


expected behavior:

all the power button presses are recorded


observed behavior:

only the first power button press is recorded


i also have a desktop computer with a ryzen 5 2600x processor, but that 
isn't affected

#regzbot introduced: a855724dc08b


Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153E375
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 02:41:48 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-56401f1da3dso1807657a12.0
        for <regressions@lists.linux.dev>; Sat, 29 Jul 2023 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690684908; x=1691289708;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAiaID6w1L7IDF4pZp9zfrtsyHgijsW1Y/7VAznx6cY=;
        b=EuS25bqI/gdh/aViCI9NX1VTpgUw8o1S+MN+jO0vY/GVNfOY+Gyj4X48Kn63ZDTeli
         y7mWBYVCuyiUNN09nyTrbr8mQuuwBFu9Cmj7f3jyKpSI7DSVxYTif31xz1Iq7dvtk4g9
         D0MCaGNLPmAH/QLfwNgLfUNqug8XEHVlQIxgUIiNJZP9MgkvfVhy/Rho3+E1NNWvBd0w
         iqj6dkadE/1XAszud6/cDAL+DSwtl5v+YXkXvS/bHeTAQyKSDMJO61mEZjMUqxSulvwY
         kR388w0dLZoRaxQcH8NAmWZgnI2W5uq7LswLHckcvn7XNC3gq5UEBfEQFno/x0ZdvSxX
         V8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690684908; x=1691289708;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QAiaID6w1L7IDF4pZp9zfrtsyHgijsW1Y/7VAznx6cY=;
        b=XIha/Ai7XYe9Le+BX1KEFSqBN37GOPIvHXMYe/dIDZpgC5cq8aCSkZ6KfOD2eoig2H
         onCo7ywqXWDhBIq3r2AV3FmSsVo0NSNslPz693Pvs9+95gskFnoSfqzzQzGDakAFEHmh
         su8i5XY4hoh6NL+97BlmBmvVCnqXjs8L5RCka1y0sj/LD2L8vwHMx/X+Jwqi0FW8T6DL
         TNAiSZQWJzczRu00cBMuR/y8KKZst68LJXnzSBoVRo44z5PVUuSS0p0YaV41hhP4R2F3
         cojbkib9YoJ13QBvMSTLMIo4bN1SZSOh6uaEWS6TEJGZs2WTO2pHuDl9YTB69gTt4cPq
         g+sg==
X-Gm-Message-State: ABy/qLYt62Fba0dV+Q9NbqNFvg/1VEl0D4jjiI3mp8F4AmInfEUvPLuB
	ddPUbFhwcBqNLoH8sLZwmUtqihDyGjh59w==
X-Google-Smtp-Source: APBJJlFnfFzSE3di4bhKDbvhJVvGN9MhEqLfHgyjFDntNOf917WPORB5Hu9T0YH8iLOVwImfCCPjTA==
X-Received: by 2002:a17:902:7242:b0:1b8:e2a:9ede with SMTP id c2-20020a170902724200b001b80e2a9edemr5433751pll.25.1690684907836;
        Sat, 29 Jul 2023 19:41:47 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id cx3-20020a17090afd8300b002681deec24csm5943281pjb.20.2023.07.29.19.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 19:41:47 -0700 (PDT)
Message-ID: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
Date: Sun, 30 Jul 2023 09:41:40 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Guilhem Lettron <guilhem@lettron.fr>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
 ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> On a kernel 6.4.5 and less, the keyboard is working fine.
> 
> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
> 
> [    0.668850] input: ASUE140D:00 04F3:31B9 Keyboard as /devices/platform/AMDI0010:01/i2c-1/i2c-ASUE140D:00/0018:04F3:31B9.0001/input/input5
> ...
> [    1.930328] input: ASUE140D:00 04F3:31B9 Keyboard as /devices/platform/AMDI0010:01/i2c-1/i2c-ASUE140D:00/0018:04F3:31B9.0001/input/input13

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.4..v6.5-rc1 https://bugzilla.kernel.org/show_bug.cgi?id=217726
#regzbot title: ASUE140D:00 04F3:31B9 doesn't respond to input

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217726

-- 
An old man doll... just what I always wanted! - Clara

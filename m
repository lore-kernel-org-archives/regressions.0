Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E8920EE
	for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 08:01:59 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id q2so15435269pll.7
        for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 01:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681286519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2c37Z5Nmv+yeobJ5ou3/DBhHlDmxouukV/+FtSYvJ8=;
        b=cxiipTzENf+ff/joKXuXYL3ZPox7IJudcmsynEZ7BBs4nT2kmTycoFYofJ+tXAF+zH
         S1Xvve5qD23GQ8ErveQjCe8dN9CwOioDAUze/0geVFme6qx10lBRUBKfAS6o+l/oHhr1
         Gj29bVvrBauO4RfA2HlQ6f+wLQZN2XZbztmLstXAGAc2cNivP6AgQFwjv1M12S02HhIu
         Yexh/epjn3rDAQ8UBWuDY/fjcCSjXc+2+NdRIgQ2zAqa7SEaPRkNMBV201k9DUI/AwR5
         FTwUTFOdwZjC0eoJDCyF6mjnUwjdE3nW1Zi6S069H5uCfgEHHR3EXvPcW+oBlcHNSOwu
         XHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681286519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2c37Z5Nmv+yeobJ5ou3/DBhHlDmxouukV/+FtSYvJ8=;
        b=BRgCFt34CyDUHl4o/opauwZQzbtrnceUwKZsaWlEPOL3T+pY9IDZ0NIZRCzRHmGUVb
         ULJoWlRyRgV0mpXtP/nHun9lIGwl6hK3Ue2jARNzFk6ubxMzGb/+hJAblRe327EBt12W
         UJhnw+ILYNPvreMJpps+AmOuf5kO+lREe+TyfgtcAFcljydAAHGyTAE/bejWdqpJHKdx
         ASWTNyq2Rnzgccl4j++x7q2dgsv3awG/WmEg+Pjmi+VgJo5G50sz6xaEkotykqe8ylRz
         iD/mKNFZ1MqJlmpvZHGaTSpSmCV7B3xsc2+OGP3CvEuHCp6ik1C8/ZdVxHEllw/dWHxW
         SCkg==
X-Gm-Message-State: AAQBX9dSOS5n58KL4+ZAanTd4HQHVD9uEHe+UIeaC90hSDiygXhfH9QD
	TyMT/6qPCZVloVvj4DTKYJo=
X-Google-Smtp-Source: AKy350YomXQYbhJ6ZuYeV6k/x6anYFJiF3t4286JRRwOG6Ev+aG9jW1XYcE3djxSpcjHX7gI+hjJuA==
X-Received: by 2002:a17:902:fa88:b0:1a6:4fa6:2e88 with SMTP id lc8-20020a170902fa8800b001a64fa62e88mr7284634plb.46.1681286518760;
        Wed, 12 Apr 2023 01:01:58 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-11.three.co.id. [180.214.233.11])
        by smtp.gmail.com with ESMTPSA id n20-20020a170902969400b001a1b66af22fsm11001193plp.62.2023.04.12.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 01:01:58 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1E30F105AC4; Wed, 12 Apr 2023 15:01:48 +0700 (WIB)
Date: Wed, 12 Apr 2023 15:01:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Youssef Aly <youssefaswad@gmail.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Daniel Dadap <ddadap@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <ZDZla8YOSvghVTTk@debian.me>
References: <ZdaFcP7zsR4NSv_w-G0DfY5irnJ4Z06rkleLAcYtDYynFKzs7mzYvKBi0fNnd7RnT2sN49NvdafY09Sr45vbCLC4p_bfQ3bj_gHf9LomIyw=@protonmail.com>
 <CAKsK3AnyP-ZXBhRzUsCa0+AVbd3hGxqfvoeQEvpihGqFEzM61A@mail.gmail.com>
 <Y8hue7X63tHpDBZR@lenny>
 <cf34615b-a23c-4e3c-5180-f285be514f34@leemhuis.info>
 <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com>
 <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
 <FF98666D-72C9-47D5-85CE-9E679CABC01F@gmail.com>
 <d4b47946-0dbb-9a52-fde5-595c7a181d97@leemhuis.info>
 <CAKsK3AmdWGceDyotCA-5J6r_=-+pA5rxgxYa1E0xTk8pR7Oapw@mail.gmail.com>
 <ZDY17mx7Q89Zdq9W@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZDY17mx7Q89Zdq9W@debian.me>

On Wed, Apr 12, 2023 at 11:39:10AM +0700, Bagas Sanjaya wrote:
> #regzbot introduced: v6.1..v6.3-rc1
> 

Oops, I forget to add additional commands:

#regzbot dup: https://lore.kernel.org/regressions/CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com/

Sorry for inconvenience.

-- 
An old man doll... just what I always wanted! - Clara

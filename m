Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF61962F
	for <regressions@lists.linux.dev>; Thu, 13 Apr 2023 04:19:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-632614f573aso1545543b3a.2
        for <regressions@lists.linux.dev>; Wed, 12 Apr 2023 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681359578; x=1683951578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=La9OMvWtSB3PcGI5ROzw1KPEP8/bIGHwfWuvdiM+irQ=;
        b=noIiYWxSdvIEdQy4n5Qo/8abMcEhxI4XsxwsuR4UHnNXQhIj8GO+QaVAUFoggFO8It
         nlho7P+i6KKP/G56oRVe9U8317ub1WNJG2LxUwjBhx7XPEax3C2EDBjwLngtvpruvlCA
         JOf90YmaZ8924/7Xadbdt8bYrD6Byk4EW9L4/Z9AoeMaZXMPEjG2HPnewKXO5Dml22gP
         yRdUnuHt6aq0EsNeZJqI8xSZDt6o9qUxooal1x0HGe+AyGL6DMBF8+46sW9jPTrnSh62
         dzMG6R+nabulVg3SRBZbkVOvGktIaJ3pzPDuI/DI9Z1is48pwhCnKR9QT6yXquIcqL+y
         L3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681359578; x=1683951578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=La9OMvWtSB3PcGI5ROzw1KPEP8/bIGHwfWuvdiM+irQ=;
        b=IFtekgWl3CB5RwTufsd4wnhFVUW6E6xNbjUSBPe1kHrArwR6XPczqLvgP9lDENExEo
         SeaKF1A/7/RFOQ5t5kfP2EdqOFOhZNe7Bj9lRt4cPwOk9ayZwB4Xm9DBIouLnhtl3qRq
         XMXcJaAfMJurf+jxQUsIDKJdtk0F3KGx68NEBOeEN/coyZt2X01OeDJ2M+gctVIeMWM0
         cg2WF5YraRQUEpvVxbRvKMys3nKnLUS/U+Ym9lg/mqKpmpZMGFhDLkUD7re/eRQGgstG
         NUS4HYUVuzsoJZb6NjfdA4cBDoNJTiqXq29RkB/Bv5OgOYr6MjGXwyDNZ9/ExiAPfAXw
         Ffig==
X-Gm-Message-State: AAQBX9d2lbF+jwO/jAU0drgKXlyhSqVkyte692xEcV3nmLGI3IfXWVkK
	JAMW0V7K5gLBO8BfDcCvHKE=
X-Google-Smtp-Source: AKy350akiGQxFzn7ssDnTQ2wh2ksBeqRvhbD61u4jJGQ3tmvO1KFTcDlUwUJc9wppoY84Wh0Tk4zPQ==
X-Received: by 2002:a05:6a00:1892:b0:627:fb40:7cb4 with SMTP id x18-20020a056a00189200b00627fb407cb4mr1369982pfh.30.1681359578083;
        Wed, 12 Apr 2023 21:19:38 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-66.three.co.id. [180.214.233.66])
        by smtp.gmail.com with ESMTPSA id w11-20020a6556cb000000b00502e20b4777sm406557pgs.9.2023.04.12.21.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 21:19:37 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id CF7D6106755; Thu, 13 Apr 2023 11:19:34 +0700 (WIB)
Date: Thu, 13 Apr 2023 11:19:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Youssef Aly <youssefaswad@gmail.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Daniel Dadap <ddadap@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
	Iris <pawel.js@protonmail.com>
Subject: Re: [REGRESSION] Backlight control broken on Dell G15 5515 since 6.1
Message-ID: <ZDeC1hda9PpcDNek@debian.me>
References: <CAKsK3AnyP-ZXBhRzUsCa0+AVbd3hGxqfvoeQEvpihGqFEzM61A@mail.gmail.com>
 <Y8hue7X63tHpDBZR@lenny>
 <cf34615b-a23c-4e3c-5180-f285be514f34@leemhuis.info>
 <CAKsK3AndZCBGaiJbQMMo9i9Gg5BHuLpvVY2tTAJWrbJ-RETZAQ@mail.gmail.com>
 <Y+/NzXqrgapfi/PY@ddadap-lakeline.nvidia.com>
 <FF98666D-72C9-47D5-85CE-9E679CABC01F@gmail.com>
 <d4b47946-0dbb-9a52-fde5-595c7a181d97@leemhuis.info>
 <CAKsK3AmdWGceDyotCA-5J6r_=-+pA5rxgxYa1E0xTk8pR7Oapw@mail.gmail.com>
 <ZDY17mx7Q89Zdq9W@debian.me>
 <ZDZla8YOSvghVTTk@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZDZla8YOSvghVTTk@debian.me>

On Wed, Apr 12, 2023 at 03:01:47PM +0700, Bagas Sanjaya wrote:
> On Wed, Apr 12, 2023 at 11:39:10AM +0700, Bagas Sanjaya wrote:
> > #regzbot introduced: v6.1..v6.3-rc1
> > 
> 
> Oops, I forget to add additional commands:
> 
> #regzbot dup: https://lore.kernel.org/regressions/CAKsK3AkWhAx6cvt5ABRecun+24FVQa441OrYfzYQ5fJpJHCqmw@mail.gmail.com/
> 

Oops, I have to mark this duplicate as inconclusive:

#regzbot inconclusive: mess up as duplicate (originally menat updating introducing range)

-- 
An old man doll... just what I always wanted! - Clara

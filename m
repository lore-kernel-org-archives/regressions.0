Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58EF15E96
	for <regressions@lists.linux.dev>; Sat, 23 Sep 2023 15:03:06 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so11569273a12.1
        for <regressions@lists.linux.dev>; Sat, 23 Sep 2023 08:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695481385; x=1696086185; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf35qT3wdmI9FAWcSv+LLoKLH4mSf1lcVMZuMPVU6oU=;
        b=deUIswWVeqsLq4KkAGtNlCyLar0jpn7byhPDg+3ViDXTE8Qk362ZdN5iAGKlcKgRoI
         DYstgtWYJjYEvnLPEnojgrcotSBoe0JXQTY2NaTKviWjoDT+qtppeXf15Os3m5hmi610
         AI3K4Z4qZCLDuYPCSw3Cxhm+xt4hLudCFxap5mD6X+agYLSQGLysx70xJ/QestkXsFF0
         A0KmX4ygQCMieRdcqQYo+ImXt+9tUU/WOPKsMftG/uKT6Be31mNYYTsHuTT3SiwkE60u
         44HsUulE6L3tdsVA3R893dcunyMy7D3XsxYweLD9RSkZ4l/9jxkBcmJ1+J+InaW4EFV1
         oRIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695481385; x=1696086185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mf35qT3wdmI9FAWcSv+LLoKLH4mSf1lcVMZuMPVU6oU=;
        b=pDpF8MBjRIMWH91D3aw9a3nnv82zew6XQdyqbYIGAkDK7RPRG17CEKfufYyVFJl9ye
         wTAn/LLvOFgcO/zDyJzZlTLS4hDxMVleiajXrnSXBc+xgqZVf8AQf4dlx9ybenliE5st
         BhR45a3VYEmkCzPbDU0oaE4DXx6qyfYFeZqZ62SD9B/LaHyddmUH7X0spPAlvLP3ixGZ
         he8BtfWtsv6tbpwhOgY8gE1TTj5p6LNvyIUq+gFOVY5fh7bN5LCr7i8hD3+Eu9ag7weZ
         4gmgtZFv4OCrzG6vM1dh6WfU6QcRWKieDZSEByua+LKD4fjnnAjL1lnt1e/fov5Q5r1/
         klcg==
X-Gm-Message-State: AOJu0YyVFcI6XH3T31TAytZirpYnCS/KhUZV55fiopL5k+No2w3aGegB
	k8L2f3oNqYJ0mlr03I5l2qjV8wSf2aVnp0pg53UiVKpAEYU=
X-Google-Smtp-Source: AGHT+IFTXCZmW7UzyuZf1BuVac1rOqZQiIlUVcsQFdbBPX4v4s9HlTCZMWamY4v7PtF6t8H1zObaw34V4PtUnHSsCTU=
X-Received: by 2002:a05:6402:270d:b0:530:bfb6:66cd with SMTP id
 y13-20020a056402270d00b00530bfb666cdmr7966668edd.7.1695481379778; Sat, 23 Sep
 2023 08:02:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO8oNb2hpegB6BbE@debian>
In-Reply-To: <ZO8oNb2hpegB6BbE@debian>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 23 Sep 2023 16:02:23 +0100
Message-ID: <CADVatmNY=KB-KCpMAGU_krpoX-eKxha3BSHT0u9XfcPuEoOMPQ@mail.gmail.com>
Subject: Re: mainline build failure due to ace6d1448138 ("mfd: cs42l43: Add
 support for cs42l43 core driver")
To: James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi All,

On Wed, 30 Aug 2023 at 12:29, Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> The latest mainline kernel branch fails to build alpha, csky and s390
> allmodconfig with the error:
>
> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~
>
> git bisect pointed to ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

Since its almost time for v6.6-rc3, so just a quick reminder that this
build failure is still not fixed.


-- 
Regards
Sudip

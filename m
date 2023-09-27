Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1579FD
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 18:49:59 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-405524e6769so61837795e9.1
        for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 11:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695840597; x=1696445397; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1itOLkylDTQc/2A2yBLCkbYqw9eu/lNAc5CXGwFbJ0=;
        b=R85AiXwmCUwc7QFOhvg4HMeMuY6f5GA1SHTqOPYypWXgHidGCGjICbWLrpLhSYm4+T
         gIcBmOWPaZQVGheGNzbopKlP29rh7bvADF+gSlRg4ptzOOetRq7J0yx+aodvLrQfpDvD
         1SjEvaXyv2X0rFCzSkdzPQB12NW8H3cEPwV3DBB3QpjGomuDg2UTC+1bAQaCDkc6Rp9Z
         4pNiBv6uDofpTX9eTlSneiYWQyS5bQ5hBNUkFohWCc5RSIf5OhvOv5tahcaVXeGQ0B2b
         38YxqcS+b0S8kzmazmv4wa2NkC1ruks3j+sWET6KIZXh4POjto/6JomqD0XyzHZ5Nrv2
         eWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695840597; x=1696445397;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1itOLkylDTQc/2A2yBLCkbYqw9eu/lNAc5CXGwFbJ0=;
        b=t+Yvag5fXEfPZRW24YnO6MScBAT1miYhjOrAcYGlkSqZkV7IEzaVbkq8XFy1tTIhNe
         zMB71fVeN3IneIUOGys6azpxzeUlZxUGBFXsDxiB1CG2UPW/iKqM/jifCWFU4xVJSf4O
         tlZ1R5NwnE7hGWR+DvgS+m98AJACMZmdIGh1Jb5BA49yO6uRm1wY3vRfIjMNDMUacCdB
         eU6uBi9J3QZ2CMGEwFJAExlDL4Hm8Ew0eGSAuCGVBpOzvDwgEz+mxcmFhWykoc3DrpYk
         8N8S6mrxILzzSOmxRjtjQ591OIsmCLzImocJpRT7CIaIZmrGKJO7X/uOCv9z+/ajVmI8
         ucYw==
X-Gm-Message-State: AOJu0YzSVzt4cCUcwUlfqfDCsfC+7gLuhS1BzbD/NOAQWJH7BbpnmYiO
	+DLb0ORiuRn4qhSBfDevoSe+z0okwU0yAA==
X-Google-Smtp-Source: AGHT+IGeFdsdEIFmk8RA4GwxSOTEPxHmjmcwLkojsHT6AEJXOvOw35P8cqeCoxyKpOpJNO67PqbsrQ==
X-Received: by 2002:a05:600c:2044:b0:405:3941:ce2c with SMTP id p4-20020a05600c204400b004053941ce2cmr5457597wmg.6.1695840597222;
        Wed, 27 Sep 2023 11:49:57 -0700 (PDT)
Received: from yoga ([2001:638:904:ffe5:5742:c50f:bd0:6aa6])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b0040531f5c51asm18515027wms.5.2023.09.27.11.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 11:49:56 -0700 (PDT)
Date: Wed, 27 Sep 2023 20:49:50 +0200
From: Sven Frotscher <sven.frotscher@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
To: August Wikerfors <git@augustwikerfors.se>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev
Message-Id: <2ZQN1S.P7M0RX306S1D3@gmail.com>
In-Reply-To: <e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
References: <R5KN1S.18M6QDS4T9PY1@gmail.com>
	<e8479eff-a5cb-41b0-8bf6-bcc20ccbecfb@augustwikerfors.se>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

Hello,

 > > Signed-off-by: Sven Frotscher <sven.frotscher@gmail.com>
 > Since this fixes a regression caused by commit c008323fe361 which has
 > been backported to stable, please add "Fixes:" and "Cc:" tags above 
the
 > "Signed-off-by:" tag to ensure the fix also gets backported in a 
timely
 > manner [1]:
 >
 > Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on 
Lenovo 82SJ")
 > Cc: stable@vger.kernel.org
I will.

 > > +>..>...>...DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 > > +>..>...>...DMI_MATCH(DMI_PRODUCT_NAME, "82YM"),
 > Your e-mail client seems to have mangled the leading whitespace here,
 > which will prevent the patch from applying cleanly.
My e-mail client isn't the problem here, but my Vim syntax highlighting
for tabs... I should've noticed that when copy-pasting from test e-mail
to patch e-mail via Vim.

Should I reply to this thread with a [PATCH v2] message or create a new
thread?
Anyway, thank you for pointing out these issues.

Regards,
Sven



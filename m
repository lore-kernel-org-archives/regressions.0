Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F35D1E9F9
	for <regressions@lists.linux.dev>; Tue,  1 Nov 2022 23:00:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id x21so21623730ljg.10
        for <regressions@lists.linux.dev>; Tue, 01 Nov 2022 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9UWlrhGX03RO6ReKvfYCRk7D2QbEdkXgk1Jw8GtoLdc=;
        b=Pq3inMdc11mjCYRR3aOCxe0fIpBL8te0vA1cks+0mMT/U5OVKug57fgMRdc7iZLpim
         CpxaJOIxZfYRWuXKDJ8KqK5kpXMSnuFciYR2Fut0GvfUPaDHorE1SHSdyHNrLNNUr9YI
         9r6RJp0yU/2XdgObMSUYml2m2md/bfhNbEMgiBib+XkkhSqFlF309gWbTh0/8XdIRok8
         Cs7hp6Os9hm/l5Z9hx5I+ZvCHrXXKWQpFZj2APy7wc5ujFy+FfLdkAnsFemM//aZyWo/
         gdFoZ/6dBu/ooMixOio81RyiMFqzBG4ue1udXNmowMgQqYETcOQTgfymCS4UwDCfxLRI
         fgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UWlrhGX03RO6ReKvfYCRk7D2QbEdkXgk1Jw8GtoLdc=;
        b=PTaFzdUjEAkdvBfEvcq7/e8MRGkCPXj0jS4Kvwf1CL70pP+WZTROhQrrSmPljr/HsZ
         PrAzNxUfW8OK0MePiBn/5wHKMihonoUVaAGAqmu9tpZT/vyEwk5XCE59o4lgecSTC7Y/
         DAevdnlETyxBs8x7rLPOQ0USyhqheA+CPXEk+DUculx5jH/kycduV7wcnAaM7ctRAUyD
         8XzSMds7Y42CC0QxRz10h8mo+6QVXHAKDHORBDZBeRALDVSQN1WZrSd64nglLYuiQCcA
         NmKPOzdKFi+pNTs0L3JTyPBPzvFGtvGg+dQ3SE7AdQu/xNe+KHWnXXibNUfXceFt8Q0d
         Ta0A==
X-Gm-Message-State: ACrzQf0gjIXRBMZCxglegiEuE3PJPCWSI6NGqIZMKId27pQvUgTgdPkn
	sRDejd/tO+XvPJ1SdRYcxCVRPUOVSmRuzz4LR2E=
X-Google-Smtp-Source: AMsMyM6sqZvKWW7raLm/pWpera4S2mX056rfw6tiLIN+pASYV3qZZJ2QfIF0j5eJ1uD+z8nqvU35YQAyguKG2Njm6uQ=
X-Received: by 2002:a05:651c:104:b0:277:42b0:9085 with SMTP id
 a4-20020a05651c010400b0027742b09085mr7093165ljb.47.1667343628385; Tue, 01 Nov
 2022 16:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAM6Wdxc0KRJMXVAA0Y=u6Jh2V=uWB-_Fn6M4xRuNppfXzL1mUg@mail.gmail.com>
 <20221031145046.2a7f9d32@rorschach.local.home> <CAM6WdxeZbGmRopXqLtDNTwPOahnyC6GrCfv4H1m=mF41-J=VbA@mail.gmail.com>
 <20221101153135.5345c748@rorschach.local.home> <CAM6WdxfYU1Dc6dkMQMSGjgiggrziLvfwVPJV5OC02_AQO8YkVw@mail.gmail.com>
 <20221101173802.7a476a04@rorschach.local.home> <CAM6WdxdAF5X8v_tbL1LvNDXgEPY5veL_OtQv5CrADV9qH4um-g@mail.gmail.com>
 <CAM6WdxfsP13aS62=xWNTFEEzAekAuDwFTpnONP9qF3br-65KWQ@mail.gmail.com>
 <20221101183512.285cfd68@rorschach.local.home> <20221101184347.2ecce20c@rorschach.local.home>
In-Reply-To: <20221101184347.2ecce20c@rorschach.local.home>
From: Roland Ruckerbauer <roland.rucky@gmail.com>
Date: Wed, 2 Nov 2022 00:00:16 +0100
Message-ID: <CAM6Wdxft33zLeeXHhmNX5jyJtfGTLiwkQSApc=10fqf+rQh9DA@mail.gmail.com>
Subject: Re: [BUG] NULL pointer dereference probably caused by kernel/trace/ring_buffer.c
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, regressions@lists.linux.dev, 
	Steven Noonan <steven.noonan@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Success!

Now rasdaemon is segfaulting, but that`s hardly a kernel problem.
Seems like the check fixed the problem.

Thanks,
Roland Ruckerbauer

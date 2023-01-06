Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66395E9
	for <regressions@lists.linux.dev>; Fri,  6 Jan 2023 22:28:19 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g7so3438881qts.1
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 14:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXQOUJjcoX1hrsbbTN+Z+gwuy5Yx5WlxprMyzhgXuL0=;
        b=FSwATMmksAKMdpu1wQNSAU4HfcxbtJpqP5jg4jxAia7ZjIAJt4LpHBViEiX5ZkvhWV
         XA077dHR8grrfxkhZnG7h3W83Y6u9reeX0IgVJqi16hhxZZAnt1gx0ImUTDz0+wZcva6
         cB9bwoRmvnDNak/FU5AzQ18NzyvaFmMkZwKoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXQOUJjcoX1hrsbbTN+Z+gwuy5Yx5WlxprMyzhgXuL0=;
        b=NzAP0X4WBCDOL7TvPbSJyplJfz31rbV4hBFu4SvWNeI6Jw2Cf4LWAFRpBzalNVvqcY
         nLMX0VnZeW+m8ZJeDM1nrRrhMIa4E5yXI8VGs3oe/Wcd4uviSKT3X+3t5Z1x+yZfY9Ai
         OsuZqxoEVFUFUy5gw64pC8jBtg3ZW49PKUGoha1TYzzS+O5XC69dpXA5Ikg/f3MrIyDZ
         vFMRf8GvW2q7i4JtxnYVKYxn5tpu9nVAnhfb6QYF6UbVIakTe0EPDJebR66azaDh2dAQ
         vVhNH05qoenNeXUIsqxkFDd80m3lS07MSgL9FCMIxRuQTsoyyQlp3LK3Oww5AU+L25Ju
         j4Pw==
X-Gm-Message-State: AFqh2kr48ihpnRAGyRRORWD88PgQZJurbBafVKBGEwLagQpALSO+YxoB
	7LzvY8BOoh4tNL6GZyEar+pfXepMsDYYG2Hr
X-Google-Smtp-Source: AMrXdXtfKi2Y5f0jQvvYepIgjhHc82yfLLhbuPgNd+/yYHdg37yJC5XOnievmRLiGK/X7mH/phCEVQ==
X-Received: by 2002:ac8:4a07:0:b0:3a5:8084:9f60 with SMTP id x7-20020ac84a07000000b003a580849f60mr79454218qtq.64.1673044098165;
        Fri, 06 Jan 2023 14:28:18 -0800 (PST)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id q6-20020a05620a0d8600b006fa43e139b5sm1199180qkl.59.2023.01.06.14.28.16
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 14:28:17 -0800 (PST)
Received: by mail-qv1-f48.google.com with SMTP id l18so1169427qvt.13
        for <regressions@lists.linux.dev>; Fri, 06 Jan 2023 14:28:16 -0800 (PST)
X-Received: by 2002:a0c:df09:0:b0:4f0:656b:c275 with SMTP id
 g9-20020a0cdf09000000b004f0656bc275mr3791255qvl.129.1673044096460; Fri, 06
 Jan 2023 14:28:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7dPV5BK6jk1KvX+@zx2c4.com> <20230106030156.3258307-1-Jason@zx2c4.com>
 <CAHk-=wjin0Rn6j+EvYV9pzrbA0G2xnHKdp_EAB6XnansQ8kpUA@mail.gmail.com> <CAA25o9Sbkg=qD+DH-aqXY9H5R_oBtePcnqagwAGCgoUk8D-Vyg@mail.gmail.com>
In-Reply-To: <CAA25o9Sbkg=qD+DH-aqXY9H5R_oBtePcnqagwAGCgoUk8D-Vyg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Jan 2023 14:28:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi60PhJRzaBJ9uvVCpOpqSsKy=oXkGDq7t844BJ6dRcmA@mail.gmail.com>
Message-ID: <CAHk-=wi60PhJRzaBJ9uvVCpOpqSsKy=oXkGDq7t844BJ6dRcmA@mail.gmail.com>
Subject: Re: [PATCH v2] tpm: Allow system suspend to continue when TPM suspend fails
To: Luigi Semenzato <semenzato@chromium.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>, 
	regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	linux-integrity@vger.kernel.org, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Johannes Altmanninger <aclopte@gmail.com>, stable@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, tbroch@chromium.org, dbasehore@chromium.org, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 12:04 PM Luigi Semenzato <semenzato@chromium.org> wrote:
>
> I think it's fine to go ahead with your change, for multiple reasons.

Ok, I've applied the patch (although I did end up editing it to use
dev_err() before doing that just to make myself happier about the
printout).

            Linus

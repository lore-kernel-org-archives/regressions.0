Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAAB7E0
	for <regressions@lists.linux.dev>; Sun, 12 Feb 2023 00:41:01 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id sa10so24129968ejc.9
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 16:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d+Yc5GEsj58XNQLYGh7tO2KtoPIPeJSL4iGRvP+Kg7M=;
        b=QaAd/PnW9D1eu/UXRg5FHeqrBR+5di7X7KJ1JV5+vX5qTyjKY+FsiH3amYLsdVcO1Q
         4TD+eJDwRvZQbNd87zWLmyN9VcWv/1Zc/4bgRmPIdePpYnNSyKKvWpCtizveCrrd36Xk
         n+zeKuQbOD+axb/3nj0x9bWzWxwJuJYwIZQxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+Yc5GEsj58XNQLYGh7tO2KtoPIPeJSL4iGRvP+Kg7M=;
        b=D/EZxRvgXYscNV8JEjJ6fgeLgjIXgGGuKSns0x/B+Ph4Vz7tkly9gf9a2Rteiyrvh/
         dOupjLs/P0rSZJesuPaoImA+viOx5nkxaPaL0NlzM0iqfwJKOiWWPWqR/6pEj1+YvzF/
         V/cFHqnxx1F36NcPnKQGRVqDes8wYzARIErfaytIsIdfQZw1D79HezK0GzzwhW21lIkl
         1qqeqpSbpKB1h3ET0yiZUuAbwq+i2d0c7vABUOD6A9/IZQBLJTw39uRIZvSL2j92bura
         GBQtOeuZ43bUsQzoo8zTXhGqcErjo7PPro5bYRo7ufdlzc/i4vC5R3I5GNX2G+7Pk2CD
         /0sw==
X-Gm-Message-State: AO0yUKUUV1fQ3Rx3jK7qbV+Pmd5SrbFIY6B3pPPb7wzvM/hfHOnrbM0C
	PJ4BmAi8TKH5Q/W6LUuPRpYpCmMo+bwYGM6S4eo2jQ==
X-Google-Smtp-Source: AK7set+OqcuYVAdtJ5vlhcVmT8lRmfazc6tIsugcF6AElQgScqziUiZGGfeAXHwEVFa7TVMu/hhDFw==
X-Received: by 2002:a17:907:20da:b0:8ab:a378:5f96 with SMTP id qq26-20020a17090720da00b008aba3785f96mr13320098ejb.3.1676162459460;
        Sat, 11 Feb 2023 16:40:59 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id br2-20020a170906d14200b008818d9e0bfesm4552847ejb.117.2023.02.11.16.40.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 16:40:58 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id sb24so217356ejb.8
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 16:40:58 -0800 (PST)
X-Received: by 2002:a17:906:16c2:b0:8af:4100:28e5 with SMTP id
 t2-20020a17090616c200b008af410028e5mr2539793ejd.0.1676162458573; Sat, 11 Feb
 2023 16:40:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <167613641114.2124708.9785978428796571420@leemhuis.info>
In-Reply-To: <167613641114.2124708.9785978428796571420@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 11 Feb 2023 16:40:41 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi4-LenywoHYw9W5QZeG8RaV+9htGhR02QAe_LDSA5pgA@mail.gmail.com>
Message-ID: <CAHk-=wi4-LenywoHYw9W5QZeG8RaV+9htGhR02QAe_LDSA5pgA@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-02-11]
To: "Regzbot (on behalf of Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 9:28 AM Regzbot (on behalf of Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> * the fix for a SPI issue I already mentioned two weeks ago is still
> sitting in next;

It's now in my tree.

               Linus

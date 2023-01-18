Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE892CAB
	for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 20:44:50 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 203so39675882yby.10
        for <regressions@lists.linux.dev>; Wed, 18 Jan 2023 12:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lxN0ifRPJLWymSPxr4LmL30NaXej0tc2KddBtHP7xgk=;
        b=o/L/KAVnrxKsg6wfxIIKKTthzenbBpd8Yyjgu45Qrq8xfHYi9SJZ4WC3ePKrhqyRNg
         0YWgPVF65SgQmhgKuSIT8Z35J7QzxNWKbJ7Mch1d4dIbub2+03oxAQhJ3OzwtUGbSDu6
         IeONYzFGg8zICe9wX7jtU34Q+HHNzy3/mSlT0m9BQdc2iwNhYeYVxLOpuafpOJl8J6bV
         es/KDYitXm0tt3HDdtiL2CEMzzYymJFNp2e1nyvq1m7OWfjdXl6a93j+FNHDWO6yHfx+
         NjPLHNd1ZZULF1ATwHQ8s0jR0DUFaww5AQ+dNZmrpw04Vc/hiUi9H2jaK1McDF3hyape
         MYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxN0ifRPJLWymSPxr4LmL30NaXej0tc2KddBtHP7xgk=;
        b=D4DfMxAJFO4ljnygi8d2VqMyqB4KomjQVxpqniZgPMPgZJAlcetQtE5o4CyyYrlL0D
         5HQ7C/k4WGmTUk2JGRF8M3leGTpx8dG/+OhG7MUBvtgYxEF0Cu7/UUE4c9/yisoYXtn9
         Xf5kRHEzrJxCXh6UocFsEMco/SAcZvExTjsnthfmtx0WTt9quxTM3zAOA5ly8a7rGmle
         1Z+WZT/zvKFRYXR2sR2iGf6LELMlep+EvLARwlPFH4iaiEcF0Nw1jKhpr4LSi05fmNom
         HIIRpEMVevdyZyqUDoixXvqtjBjjYJd6ZKi2n4NDFveP+nr2qEtOQomLKzpeRnAxzzSw
         1LlA==
X-Gm-Message-State: AFqh2kroRCEVYXlwxMCXZ0wt2y25/ObGzGy43IceQxrY/Qx2h9Ixigzc
	e5/heaIXfpHc7+l4l5U0KtCW0UVGsj6gnZTpOsyh3w==
X-Google-Smtp-Source: AMrXdXsmCi/frVC6VtreQlaKByYSty9vXl8uhPqMcWmgUNLPIBdL7eylfPOfYiXjvhn0Wg/c/y6sw3UwLYqAp0TyoEk=
X-Received: by 2002:a25:9d88:0:b0:7c0:acd2:6300 with SMTP id
 v8-20020a259d88000000b007c0acd26300mr858664ybp.520.1674074689110; Wed, 18 Jan
 2023 12:44:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230116193702.31356-1-mario.limonciello@amd.com> <20230116193702.31356-3-mario.limonciello@amd.com>
In-Reply-To: <20230116193702.31356-3-mario.limonciello@amd.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jan 2023 21:44:37 +0100
Message-ID: <CACRpkdaX+ZVA7zQDnADEi5KPpfd-gwsxPsKaZo5FxEmgjv4S3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xRU
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raul E Rangel <rrangel@chromium.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, regressions@lists.linux.dev, 
	Werner Sembach <wse@tuxedocomputers.com>, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 16, 2023 at 8:37 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> However on Clevo NL5xRU there is a mistake in the ACPI tables that the
> TP_ATTN# signal connected to GPIO 9 is configured as ActiveLow and level
> triggered but connected to a pull up. As soon as the system suspends the
> touchpad loses power and then the system wakes up.

Now that is what I call proper root cause analysis. Hats off for this patch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

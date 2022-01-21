Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1587173
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 08:58:45 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id m6so25564262ybc.9
        for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 00:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/CAdEqGBk7N/8QQ5A23zI2nrO/utlv2ElHpvb6u4CA=;
        b=REKUOzbTnrnoKH+nWoApUShHgZjf318EWK9itQNe1JkF4qXv+SGJQbIKI+K3H7D+95
         bcr2KPcZ5+mPIb6DxeTuv7HF9kN8W9UUcXvjL4p++kLrmkaD1KNf1eEWqFs7PSKC8dEm
         ME9OL35fUckRg3MVWpk8FylBI+5zGpdZDH3d6rrEzRZCBsJGqGX6DMeqRYiwOOP4Ja/G
         7wGTaZEhKOLsAWLQD4u0b3GOi+vYHxZgMv8Cev8mA3sgaVtzvmxSN8U5g3ueAb/LMM9f
         t55rvr2CTMly8LmNPhlTR+npOVIclcOhEtDaxU0kpotd50fmAekkmRn8B7XG0Wr161Cq
         TIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/CAdEqGBk7N/8QQ5A23zI2nrO/utlv2ElHpvb6u4CA=;
        b=T/3czRG1FFmiiUW9IJC0VtU9DfibPbTmeWz5sVZzaSrcQAYrjyOsjuNtmodInlptCJ
         8eIhpyijoDXvm8ChjL0qU7fbyQxUKu2MtyfLguxCN92YrwWBhEnQC8Wc85QiMah71mjN
         ZwsYf8tabvD1fEoQMA5pM4FwgqCz6L3N9+HDlyP7+6Np+uSfvhuTsOohejPzn1pNiW7g
         YZ4KLSFaTepAtlVDo7/+AiPPK23ylhNTYoqpBZhptZVkm6HXOaDxNFDabxsWKZ4TfYBE
         uEXtJqQfY9t5Z8KP4K77zTe0WnOCUXVQMcw+NBWDUgA7K+9s/6jo/ddrK0hVZl9A7EaO
         t9qQ==
X-Gm-Message-State: AOAM531oKTFdT8cxEVjPQtI1eZLFfFTwmSUCzQoBzOtMSje+aXnXr6D/
	Pm44g98tYAVo/5LZPtAU6wnhTy6AJU+pbeybT+HYzQ==
X-Google-Smtp-Source: ABdhPJxGI0tWvbu3C1KPF9nJZim+8Kq1aJ/5f3LrEb7Cs7qRdYvtHbmNg0CYHyFs7ws6XGnbWWn724o1yPYmp+AIMhU=
X-Received: by 2002:a25:9082:: with SMTP id t2mr4422729ybl.684.1642755524616;
 Fri, 21 Jan 2022 00:58:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
In-Reply-To: <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 21 Jan 2022 14:28:33 +0530
Message-ID: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer type
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-mips@vger.kernel.org, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Zeal Robot <zealci@zte.com.cn>, 
	Minghao Chi <chi.minghao@zte.com.cn>, CGEL ZTE <cgel.zte@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> I just posted a fix. As I do not have the environment to compile test
> mips, could someone test please ? I will send the fix to Linus asap
> after confirmation that it is OK.

Please share your patch / patch link. I will test it with tuxmake.

you may also give a try with these easy steps.

# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.
# Original tuxmake command with fragments listed below.

 tuxmake --runtime podman --target-arch mips --toolchain gcc-10
--kconfig cavium_octeon_defconfig

- Naresh

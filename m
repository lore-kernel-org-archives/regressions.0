Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AAF3C1D
	for <regressions@lists.linux.dev>; Mon, 11 Jul 2022 11:02:00 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id p128so4572523iof.1
        for <regressions@lists.linux.dev>; Mon, 11 Jul 2022 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=zZThk4si2Df2oCcklrdiFPTJcwReEc+65EKNL0Y3jcA=;
        b=hEAtnyVmAaVw4hGQPfDNKMFHfWf4jgRpP6t4mIOeQ1ii1bvWwarph3IkjYrIp0OHcM
         qqzhukxCRTsCy2RVueuQQQ471HbVEMfojJarVVyC+rLT8dl3eICYvnz7xoC/mrSDKGV0
         DRCf/BUiKfzxT3KKEiQGdL9tCVlRRL1ZEXVkdvmKXlbLCYPvw2TsXYP+Mi5YSQlDhyZh
         6IbCzUrXnPovc6SlPMeeaDkvS1/MhIuOdTlUe+Mfz1qx1AE6kwOIMVhF1IYf5/Sey43z
         My6U9MNYp4hNZW2paUpegGjCM3lsWb4BMbzKL5nyqTSA8a/2whpRXJBDNTWMURGttMGB
         uCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=zZThk4si2Df2oCcklrdiFPTJcwReEc+65EKNL0Y3jcA=;
        b=h/TkNenVDMmhe2XUizhoXflIqW6o+AK84Fr9mCKm4h1MOBQQVuBInR/EDmGcJRzUfC
         eWP/c08wcKDbd0X3Ouz5LPk/+ipEd33ABCAUqP6drj8PJL59WM7Lbhk1m3JzY5y1b9w0
         FzES46/5eZSItdWMrrKTSqw1K9DY87BGREIZiJU+KLYuPzjw4lcFcrvTuuXjg/P3RvX0
         MpgUDydj2O4fIXuIzrgpUW5ygnrjbDRr7wtzGrWSZmc3R8VAtrV25WAKBDFIkPS3p0bP
         n/eVwh/9f9y38HliikxZ3a9HwCRu2vovSpMKD1tJedhyXmAd96rV7EK8PdHFW9tjLw4k
         1Wjg==
X-Gm-Message-State: AJIora+805eVujdVdvbR8NgPHILZ2aQ6G8IisNzXl834D8er26a/yAyC
	eqIekRecyPC6u6b/GuHt7fU7SD1yZUjPMxXuYaqymw==
X-Google-Smtp-Source: AGRyM1u0MaIJ0uypZPWBkAr2NPKGat9OktcIuoHO3nP77sJq2pHTDV3AU8nizI+RjOYBzF88RInvbapcqca0SsR3g6c=
X-Received: by 2002:a05:6602:2ace:b0:678:d781:2984 with SMTP id
 m14-20020a0566022ace00b00678d7812984mr8968851iov.186.1657537319833; Mon, 11
 Jul 2022 04:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Jul 2022 16:31:48 +0530
Message-ID: <CA+G9fYvh7Wocueo0hb_q17xaEsnY_qLO8sFnEQG01GpK4rcwYw@mail.gmail.com>
Subject: [next] arn: PM: domains: Delete usage of driver_deferred_probe_check_state()
To: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, regressions@lists.linux.dev, 
	lkft-triage@lists.linaro.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Saravana Kannan <saravanak@google.com>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Linux next arm BeagleBoard x15 device boot failed due to the
following commit. The x15 did not event showed any crash log
on the serial console.

Anders bisect this and found the first bad commit is

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

commit 5a46079a96451cfb15e4f5f01f73f7ba24ef851a
Author: Saravana Kannan <saravanak@google.com>
Date:   Wed Jun 1 00:06:57 2022 -0700

    PM: domains: Delete usage of driver_deferred_probe_check_state()

    Now that fw_devlink=on by default and fw_devlink supports
    "power-domains" property, the execution will never get to the point
    where driver_deferred_probe_check_state() is called before the supplier
    has probed successfully or before deferred probe timeout has expired.

    So, delete the call and replace it with -ENODEV.

    Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
    Signed-off-by: Saravana Kannan <saravanak@google.com>
    Link: https://lore.kernel.org/r/20220601070707.3946847-2-saravanak@google.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
index 739e52cd4aba..3e86772d5fac 100644
--- a/drivers/base/power/domain.c
+++ b/drivers/base/power/domain.c
@@ -2730,7 +2730,7 @@ static int __genpd_dev_pm_attach(struct device
*dev, struct device *base_dev,
                mutex_unlock(&gpd_list_lock);
                dev_dbg(dev, "%s() failed to find PM domain: %ld\n",
                        __func__, PTR_ERR(pd));
-               return driver_deferred_probe_check_state(base_dev);
+               return -ENODEV;
        }

        dev_dbg(dev, "adding to PM domain %s\n", pd->name);



--
Linaro LKFT
https://lkft.linaro.org

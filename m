Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064F77B
	for <regressions@lists.linux.dev>; Fri,  2 Dec 2022 05:27:19 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id b21so3682443plc.9
        for <regressions@lists.linux.dev>; Thu, 01 Dec 2022 21:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSxc/vuw8b8ZlV/zQQB1AHYxMkA7FyAjq/UT8DAx5EM=;
        b=JxjJFek7AAPKxa74aAl5FtksMKDZBRv8UpjC6oDgN8cTcnEoLw1Ea1XvcpICJmfCP/
         B0u5qpGMP6zAnvqu4HscpVX9p3enKr5Ji9GaHQV1SvFteYNQIcjkhB4jZ4jZTaPg6Zu+
         5pMLjpVs2ZOskNgLywnTUs5/YKE964gxJSTMstdhauLcD9QjTTYVDenmBEjTC+k4XgNe
         PTFuOJt+wifphpsprqfu42xfYcMzG9jSudpYrHsfdu0rvxrfvUHJf8V3yJP9BLdW7hJb
         0zm9U5Rzsdc+BjbzYcj2mISlYjxGzgzWFYZGzYcBasXnskxBtAJSbsqztCRjO9MN2VD7
         OUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSxc/vuw8b8ZlV/zQQB1AHYxMkA7FyAjq/UT8DAx5EM=;
        b=4GOe26+/06Bf2852JzJLAEAjTllUroLOTbuBVWpPuD0KkHRGTBV4jHMBKeeViiMsdD
         jHehBo745W0shyYIGwhoxQd9MwFx8HjrDFJigg9NaVW3h1YoMi8xyFAvYpHh5vz24res
         rIpNTYQEJ0YdRa5FE/Vk7MQwid4fH/Af/jBIxzb/KowiUdWF9K4W84n8KMGLJWjeVOZv
         HgyybqBPOanEl2x4sAhI7dwQ4z4SSp3tb8xqA71687XxJqBYMbBWdctedQDz4vddfRyr
         u8ghACqPa7nV8gkU5xmU55kFLAqlPdVIzSd4nvGfL5WEvrsLGU1Cajqhs1rkfPBgSQok
         kaCQ==
X-Gm-Message-State: ANoB5pkkaQUTniFeiIVtLgYHFCaM6qc5HvhOwcTLN1vgqQEk+g9tEd8a
	gGLpJDw1p3utOFoP6Kwf0frRKQ==
X-Google-Smtp-Source: AA0mqf4qhJ72iEB1qNdRF4ONDN4xQ7Tu4gAgw2SXdas1iORjFhdOikJ95Q7LaqhRV0EwhSaiwVYZHg==
X-Received: by 2002:a17:90a:5991:b0:218:47f1:b47b with SMTP id l17-20020a17090a599100b0021847f1b47bmr73243982pji.201.1669958839315;
        Thu, 01 Dec 2022 21:27:19 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm4273317pfg.96.2022.12.01.21.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:27:18 -0800 (PST)
Date: Fri, 2 Dec 2022 10:57:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: jia-wei.chang@mediatek.com, Nick <vincent@systemli.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, rex-bc.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	Frank Wunderlich <frank-w@public-files.de>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	=?utf-8?B?SMO8aG4s?= Thomas <thomas.huehn@hs-nordhausen.de>,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Message-ID: <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>

On 01-12-22, 16:39, Thorsten Leemhuis wrote:
> Thx for clarifying. And I noticed I made a mistake: I should have
> directed my earlier question wrt to any progress here more into the
> direction of Jia-Wei Chang (who authored 6a17b3876b) and Viresh Kumar
> (who committed it).

I was waiting for the platform maintainers to come up with a fix. I
have sent a patch now to revert this, in-reply-to this thread.

Please confirm this is working fine. Thanks.

-- 
viresh

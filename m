Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26128D278
	for <regressions@lists.linux.dev>; Tue,  3 Oct 2023 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=gEeJIPzvzVkyH+NRCBLOt631AmVlDSMa/1+fcXZ5V4I=;
 b=cpgEdHA1ORayguhDshh9wTP273qjpW9M1AEv2E4g4Cl29ZWg5r1mH2yQZiv7bvza4jtei32plCuz
   xrOp+y2PRzTxz4ohLM1vEH8wFD7AO190Pg3f2pGTinv0QTjeLyndsdouOPzSBaGPwL2+wRq+BXDE
   y4Vkjq/Ua7LsrUj0zbPb3DHvAp+3OqhmJrOBGBff28PdGfH5TRGZ62rXowuO0Hh4xbjxXAXJjLpF
   Y2lf5pA2rroTKih3DTlZLT4zjZMbJVPWzjRW2X4PyqyKS03F7VWy9Le/qS+RUXqhYT/usiT/7bX1
   LsWmHf/zbMQfsfEhZhlHdkvEULO4k9PlZAFCQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=gEeJIPzvzVkyH+NRCBLOt631AmVlDSMa/1+fcXZ5V4I=;
 b=QR2wy4jKD7aeG2qoZH9lOmWHQ2qKOYh6omKF8BbKgeRMdqEvCNxLyNobAysrmGW/SnAxnI1mBQfa
   3RvVg2Pbi3uwsZiuke6f0B+DfFXV0FkBqQRAZAIgLuwkihb/xZPnciLaK5eofpaK9AJBJbYXbcu2
   DY4JbAevTRD7GbnWeYSEgMAt2tUtBNjnfJbPynzBtUXpVX+plz9TYpmiGx5e607kBYlTZlKj9uQ/
   Na9wLkhQD8u6J3iUGuKhilCT2h+onXyjwNwWWI13gR75V5F/Z0bzWs6IJ7JobxsgfRv6l1dYyDDf
   uVu/8kbCekfc4QJGJs022DR+HpvO23OebZMZlA==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230808 64bit (built Aug  8
 2023))
 with ESMTPS id <0S1Y00B2W5H7C800@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Tue, 03 Oct 2023 09:39:07 +0000 (GMT)
Message-id: <99eb37e0-5ade-4137-93d5-901f598f4082@augustwikerfors.se>
Date: Tue, 3 Oct 2023 11:39:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
From: August Wikerfors <git@augustwikerfors.se>
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim
 7 Pro 14ARH7 82UU
To: Markus Meier <kerneldev@epic-bytes.net>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, regressions@lists.linux.dev
References: <10347605.nUPlyArG6x@kali>
Content-language: en-US
In-reply-to: <10347605.nUPlyArG6x@kali>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAHPA+lGEgh+LcklqCHZGU1AP61IUJVJAlVMR4F30wXN/+sMVQlUrFG9qeJ7+B13
 94A63Ql7MW3ThyqPcAp3RL3tvPxJ5j49hsH09MAMDV107XX4396QxhQMYkzLWjN5
 4Zjd/LMs9BetumpnuTFIm/kacsw80cSghbJy/OpPcPcWmzx8cbBLKaAq/PnCj70+
 24MrHdIpBjiIIGKW+xiAMcKMFtaxeOpExhocul9KKdi07xjwcMLF8j7H2ARNBUPO
 1MjsQcWuQ5nhPkSt+jJqLIEfpPzzQQiZc2vakAOKVVtR3mad1NrbW4MymKQohjuH
 Q7TKYV8+R38vlC4f4nYvJvzfphUgUA6bPv5N0UJYGUBEHE1RNCC3aOyTV2hx1jSe
 QZPrpJ90eB334EFQLlw4avC6AsGJkBwfo8dy/l9rdBkByl2ZyGe+72jtIaYM2pGb RXnyjcA=

[+Cc Mark, Mario, regressions]

Hi Markus,

On 2023-10-02 23:04, Markus Meier wrote:
> Hi,
> 
> I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing up.
> I added the system to the quirk table and the mic is working correctly (but
> with very low volume) now.
> 
> Here's an except from dmidecode:
> System Information
>          Manufacturer: LENOVO
>          Product Name: 82UU
>          Version: Yoga Slim 7 Pro 14ARH7
>          SKU Number: LENOVO_MT_82UU_BU_idea_FM_Yoga Slim 7 Pro 14ARH7
>          Family: Yoga Slim 7 Pro 14ARH7
> 
> Please add this patch to the kernel
Please read [1] for how to properly format and submit kernel patches. In
particular your patch is missing a "Signed-off-by:" line and it should
ideally be sent inline instead of as an attachment (it is strongly
recommended to use git send-email for this, see [2] for a tutorial on
how to set up and use it).

Also, since this fixes a regression caused by a commit that has been
backported to stable, see below for "Cc:" and "Fixes:" tags that should
be added above "Signed-off-by:" to ensure the fix also gets backported
in a timely manner [3].

> and add it to the stable kernels too. I
Cc: stable@vger.kernel.org

> guess the microphone should have worked before. Seems to be a regression
> introduced by c008323fe361bd62a43d9fb29737dacd5c067fb7
Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ")

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[2] https://git-send-email.io/
[3] https://www.kernel.org/doc/html/latest/process/handling-regressions.html#what-s-important-when-fixing-regressions

Regards,
August Wikerfors

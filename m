Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88803FC4
	for <regressions@lists.linux.dev>; Mon, 23 Aug 2021 12:53:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629723203; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=JcfDWR4cffqT+kvemo31Qw9aFals0hPQCxPipl6EkWA=; b=EPWLnd/LrkDXjgD10FN7UZjzEKgPLgZazFnHM665FBRn0q4iSh2fpoL4X80GxXcXnrTkW+tu
 /enNrfHkq1fVupNm16ndYHoVZTshUJs0fQWu162u4EH7DV86KpuFQiNr7xJ6QXc+kLeb69I5
 DRdAtO1kyyPfbS9v7bjfpIpsjNo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0YzJmNCIsICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 61239a42f588e42af1e6613b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 12:53:22
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 1F809C4360C; Mon, 23 Aug 2021 12:53:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F0DDC4338F;
	Mon, 23 Aug 2021 12:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F0DDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, regressions@lists.linux.dev, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
Date: Mon, 23 Aug 2021 15:53:14 +0300
In-Reply-To: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org> (Wren
	Turkal's message of "Sun, 22 Aug 2021 14:08:11 -0700")
Message-ID: <87y28sqq4l.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(adding linux-wireless, regressions and some mhi folks)

Wren Turkal <wt@penguintechs.org> writes:

> I have no device for the wifi on my computer. 5.13 worked pretty well.
> I also found others reporting similar issues:
> https://forum.manjaro.org/t/kernel5-14-rc6-ath11k-on-qca6390-regression-m=
hi-probe-failure/79362
>
> Here's info about the hardware on my laptop:
> =E2=9E=9C  ~ sudo dmidecode -s system-product-name
> XPS 13 9310
>
> =E2=9E=9C  ~ sudo dmidecode -s bios-version
> 3.0.4

Do you get the same mhi error as in the forum post?

qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22

MHI folks, any ideas? I have XPS 13 9310 myself but I'm not able to test
v5.14-rc6 kernel right now.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2971
	for <regressions@lists.linux.dev>; Thu, 20 May 2021 12:36:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621514169; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=TpLmLahd2h7hQJJWsFxm53pPM8fVoixMAUaW1DdjRfU=; b=lJnpaVH2G3YeYRAb7E9b9nOUVNUV7RI0qoKEcjtFuTMPm7yTcjpOQcpa4GcfodFUTC5t3huW
 +dsVTngxOUzULXhZy/UBDZPCFjE2JqqQtdXHlH3CQbX7wxhqNKxhhV0w3pVVuDI37NHywDU0
 /DSnETLa+RH0CfCqphVAWxfyZbA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0YzJmNCIsICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60a657b6d1aee7698da9f585 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 20 May 2021 12:36:06
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id CAF7FC433F1; Thu, 20 May 2021 12:36:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D7A4AC433F1;
	Thu, 20 May 2021 12:36:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7A4AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,  Bhaumik Bhatt <bbhatt@codeaurora.org>,  Loic Poulain <loic.poulain@linaro.org>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,  stable@vger.kernel.org
Subject: Re: [regressions] ath11k: v5.12.3 mhi regression
References: <87v97dhh2u.fsf@codeaurora.org> <YKYzwBJNTy4Czd1A@kroah.com>
	<20210520104313.GA128703@thinkpad>
Date: Thu, 20 May 2021 15:36:00 +0300
In-Reply-To: <20210520104313.GA128703@thinkpad> (Manivannan Sadhasivam's
	message of "Thu, 20 May 2021 16:13:13 +0530")
Message-ID: <87r1i1h9an.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Thu, May 20, 2021 at 12:02:40PM +0200, Greg KH wrote:
>> On Thu, May 20, 2021 at 12:47:53PM +0300, Kalle Valo wrote:
>> > Hi,
>> > 
>> > I got several reports that this mhi commit broke ath11k in v5.12.3:
>> > 
>> > commit 29b9829718c5e9bd68fc1c652f5e0ba9b9a64fed
>> > Author: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> > Date:   Wed Feb 24 15:23:04 2021 -0800
>> > 
>> >     bus: mhi: core: Process execution environment changes serially
>> >     
>> >     [ Upstream commit ef2126c4e2ea2b92f543fae00a2a0332e4573c48 ]
>> > 
>> > Here are the reports:
>> > 
>> > https://bugzilla.kernel.org/show_bug.cgi?id=213055
>> > 
>> > https://bugzilla.kernel.org/show_bug.cgi?id=212187
>> > 
>> > https://bugs.archlinux.org/task/70849?project=1&string=linux
>> > 
>> > Interestingly v5.13-rc1 seems to work fine, at least for me, though I
>> > have not tested v5.12.3 myself. Can someone revert this commit in the
>> > stable release so that people get their wifi working again, please?
>> 
>> How does the mhi bus code relate to a ath11k driver?  What bus is that
>> on?
>> 
>
> MHI is the transport used by the ath11k driver to work with the WLAN devices
> over PCIe.
>
> Regarding the bug, I'd suggest to wait for Bhaumik (the author of 29b9829718c5)
> to comment on the possible commit which needs backporting from mainline.

Ok, but if a quick fix is not available I think we should just revert
this in the stable releases. I also got a report that v5.11.21 is
broken:

https://bugzilla.kernel.org/show_bug.cgi?id=213055#c11

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C43FC4
	for <regressions@lists.linux.dev>; Tue, 31 Aug 2021 10:37:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630406279; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=qzDTJsu+ue9QOjLN365DiRha10XR/lBgrs4CbIzNUto=; b=hnhuiAd69K6gjXWx2JOK+/68bJY1JofXjkfa3lkAiYK7vqJmaPoDEMbLj9goJ6Bykwmay8Fx
 VrDQNhhBCh4ZC+woP812w/H6apgEyElOqE6+shL6N77GBAZLbuOmJulfBwcUx1g9HBIdAJf+
 Tptr6BBNcuseaFhUNY5Wxx2NPsA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0YzJmNCIsICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 612e065f40d2129ac1a4a7b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 31 Aug 2021 10:37:19
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id EE763C4361A; Tue, 31 Aug 2021 10:37:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1320CC4338F;
	Tue, 31 Aug 2021 10:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1320CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: Jakub Kicinski <kuba@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "David S. Miller" <davem@davemloft.net>,  Linus Torvalds <torvalds@linuxfoundation.org>,  Wren Turkal <wt@penguintechs.org>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Hemant Kumar <hemantk@codeaurora.org>,  Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
	<87y28sqq4l.fsf@codeaurora.org>
	<843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
	<87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
	<YSenaxWzxRkYkucv@kroah.com>
	<20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<87eeag6yjr.fsf@codeaurora.org> <87y28o5cw4.fsf@codeaurora.org>
	<20210826111207.364d0ba5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<87sfyv5abg.fsf@codeaurora.org>
	<CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
Date: Tue, 31 Aug 2021 13:37:11 +0300
In-Reply-To: <CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
	(Nicolas Schichan's message of "Mon, 30 Aug 2021 18:04:04 +0200")
Message-ID: <87sfyp3noo.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Nicolas Schichan <nschichan@freebox.fr> writes:

> On Fri, Aug 27, 2021 at 2:41 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Jakub Kicinski <kuba@kernel.org> writes:
>> > Done, thank you!
>>
>> Thank you waiting for me :)
>>
>> I just tested commit 7e9965cddea8 from Linus' tree on Dell XPS 13 9310
>> laptop with QCA6390 and ath11k works without problems. So the issue
>> should be solved in the final v5.14 release.
>>
>
> Good evening,
>
> I have tested loading ath11k on v5.14.0 and I can confirm that the
> driver loads fine now, with a phy and wlan interface being created as
> a result.

Great, thanks for testing and letting us know. And espeacially huge
thanks for finding the commit which broke this!

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

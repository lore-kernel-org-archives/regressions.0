Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344772
	for <regressions@lists.linux.dev>; Mon, 23 Aug 2021 17:43:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629740606; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=T0WPNhMpwf31Yqfe1WoISD46XNqfHSpKpAZp0ydFo3U=; b=MJFJ6GW5sCHUaW9YGkKtohJ3/tvNhlsZOoOBtYH1P6lJawRvq5G8mTAU7HG+9Ob1SiBS6r3x
 cPRZavh62DGEF4lQRHBm/qri1v/Rz/U98o/C9RFfjmpge+fn4PPsU/sfNURUWWqPQQxqJAKi
 kLT/8Sb0uvTSz1+F8N+w2uiUSEk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0YzJmNCIsICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6123dda50f9b337f11438161 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 17:40:53
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 594E5C43618; Mon, 23 Aug 2021 17:40:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
	autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 64E70C4360C;
	Mon, 23 Aug 2021 17:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 64E70C4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: Wren Turkal <wt@penguintechs.org>,  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,  regressions@lists.linux.dev,  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Hemant Kumar <hemantk@codeaurora.org>,  Loic Poulain <loic.poulain@linaro.org>, David S. Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
	<87y28sqq4l.fsf@codeaurora.org>
	<843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
Date: Mon, 23 Aug 2021 20:40:42 +0300
In-Reply-To: <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr> (Nicolas
	Schichan's message of "Mon, 23 Aug 2021 18:02:33 +0200")
Message-ID: <87tujgqcth.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(Adding Dave and Jakub to CC)

Nicolas Schichan <nschichan@freebox.fr> writes:

> On 23/08/2021 14:53, Kalle Valo wrote:
>> (adding linux-wireless, regressions and some mhi folks)
>>=20
>> Wren Turkal <wt@penguintechs.org> writes:
>>=20
>>> I have no device for the wifi on my computer. 5.13 worked pretty well.
>>> I also found others reporting similar issues:
>>> https://forum.manjaro.org/t/kernel5-14-rc6-ath11k-on-qca6390-regression=
-mhi-probe-failure/79362
>>>
>>> Here's info about the hardware on my laptop:
>>> =E2=9E=9C  ~ sudo dmidecode -s system-product-name
>>> XPS 13 9310
>>>
>>> =E2=9E=9C  ~ sudo dmidecode -s bios-version
>>> 3.0.4
>>=20
>> Do you get the same mhi error as in the forum post?
>>=20
>> qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
>>=20
>> MHI folks, any ideas? I have XPS 13 9310 myself but I'm not able to test
>> v5.14-rc6 kernel right now.
>
> Hello,
>
> I have hit the same issue on Linux 5.14-rc7:
>
> [   14.780566] qcom_mhi_qrtr: probe of mhi0_IPCR failed with error -22
>
> This looks to be caused by commit:
>
> ce78ffa3ef16 net: really fix the build...
>
> Reverting this commit results in ath11k being able to load without errors.

Thanks, this helps a lot. Commit ce78ffa3ef16 was introduced in
v5.14-rc5 so I assume that's the first release which broke ath11k.

Dave, what build issue did you fix with commit ce78ffa3ef16? Could we
revert the commit? The problem is that, unless we fix this issue, with
v5.14 WLAN will be broken on a quite few newer Dell laptops.

Unfortunately I'm travelling right now and I'm not able to look at this
in detail until Thursday or so. And I assume Linus will make the final
v5.14 release on Sunday so we are on a tight schedule :/

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

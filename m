Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B62729CA
	for <regressions@lists.linux.dev>; Fri,  1 Oct 2021 06:56:57 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633071418; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=LfWfxStH7Y3/3uGWypizgZzN/AsxwvYk5KwL5dOoAzE=; b=qWaQg9/+BYMQI5Nf4YIDKNsl585a1/vvRoZ7MlcInSyuQpu1AQMe2AJCtCj5xvZ0aGIrTHiV
 pEIwH7ZqhubkOkVNY9moDCVDwO78FsfO8RRi3IvCxiK9miid4oE+l6NUuvVjc+5rxySckcQs
 WE5/L3mssLNCTyfkBTnKjJcWYiM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0YzJmNCIsICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6156b127fc6e34f8cdd8eaa6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:56:39
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 31AC0C43616; Fri,  1 Oct 2021 06:56:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: kvalo)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id D65BDC4338F;
	Fri,  1 Oct 2021 06:56:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D65BDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Exuvo <exuvo@exuvo.se>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>,  linux-wireless@vger.kernel.org,  Helmut Schaa <helmut.schaa@googlemail.com>,
    regressions@lists.linux.dev
Subject: Re: rt2x00 regression
References: <bff7d309-a816-6a75-51b6-5928ef4f7a8c@exuvo.se>
	<20190927080303.GA7667@redhat.com>
	<CA+GwT0B5SyRZnGLqwqOeuJK4CWMVc=dKaWre9VN8KQC6kBzKGw@mail.gmail.com>
	<20191203075736.GA701@redhat.com>
	<d74dab51-3a84-9035-d89e-ea8f63e89198@exuvo.se>
	<a8eeb0bc-95da-291a-7fb9-5d15d1174c27@exuvo.se>
	<c22673af-40e0-3af2-5ab7-69b23fc03598@exuvo.se>
	<f935dc15-08bd-2e28-fc1b-b27634c618be@exuvo.se>
Date: Fri, 01 Oct 2021 09:56:32 +0300
In-Reply-To: <f935dc15-08bd-2e28-fc1b-b27634c618be@exuvo.se> (Exuvo's message
	of "Wed, 29 Sep 2021 10:22:50 +0200")
Message-ID: <87czop5j33.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(adding regressions list for easier tracking)

Exuvo <exuvo@exuvo.se> writes:

> I would like to get this resolved, is there any more information you need=
 from me?
>
> I have been manually patching this all year with:
>
> drivers/net/wireless/ralink/rt2x00/rt2x00usb.c
> - if (rt2x00dev->num_proto_errs > 8)
> -=C2=A0=C2=A0=C2=A0 return true;
>
> It seems to just be some part of rt2800_load_firmware that is not
> supported on my device and generating errors but it has been running
> without problems in AP mode with daily usage.

[...]

>>>>>>> This most likely is the problem introduced by commit:
>>>>>>>
>>>>>>> commit e383c70474db32b9d4a3de6dfbd08784d19e6751
>>>>>>> Author: Stanislaw Gruszka <sgruszka@redhat.com>
>>>>>>> Date:   Tue Mar 12 10:51:42 2019 +0100
>>>>>>>
>>>>>>>      rt2x00: check number of EPROTO errors
>>>>>>>
>>>>>>> Plase check below patch that increase number of EPROTO checks
>>>>>>> before marking device removed. If it does not help, plese
>>>>>>> check if reverting above commits helps.

Should we do a revert? Can someone submit that including an explanation
of the regression.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF202147F9
	for <regressions@lists.linux.dev>; Thu,  1 Oct 2026 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822345; cv=none; b=AfHJXVDo7fX9/Q/pgsrSPe8MQKHaq3IP5vdl3Ib1hcnUZ66Mh+zHu4VE92rorw1EThXQb3+xZ+6v6q61q676Ts4fIRPONECbRm0zVSkIcuvG4BNr0NzIDZ/ijzHHe14zSs4R/KlQHp1TaknGn8IzF30JrUEH6h2Be/XLL4mXwzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822345; c=relaxed/simple;
	bh=HibY2yVbJXZTc6DBlwdMDBsFHqSRLxYPMVNLoQ1p3wc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p/4gLNNFCcLdUuZbxGI3w4ffw6FrgaKglRHc30S8sb/reR/Vm4Re7ceCHBDizSzW5CJ7kLAotl5i4myfYyCFRB+xH0v6I8n4MIoL8DbjavqgyrDMNKQ6GSCcggeD5yLJYpXtYmxIIz33rzzJ/v2jvExmLJVsV+PI9K2px8pVqxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cyIBqwXq; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cyIBqwXq"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34b4f2d90c4so2162491eec.2
        for <regressions@lists.linux.dev>; Wed, 30 Sep 2026 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790822343; x=1791427143; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=cyIBqwXqRqtMmf9YjFLQzf362/+QKqOE01bNJq3OVLD53GNAWPIcqcRrhLaCKyG9lK
         YlVeRGXimGq7rR5qaUwaqXECkH3rCxABgtvDGb1a+H+dPxLe6ahXWET4TEdZeS8C/YpT
         hw5TTWO3yXE+Ml4HZv9Ltl1jGbw01kzt6WrpnAmk/2zkLBNw7hykMYZWrdjK24KWecAP
         l/FXJdnxggbuG9a5yDrB5WsagA+dCBcIYiUMzhCWMrs7bYYQ1y4mSRG/W/W7cG+bVOkM
         wntnDDO6KoUx3xrN4O9kCFSLo9mzeZizYCQGn6yJRtQ8pz/4q2v0KbsC1gGGt74VHTtP
         JW6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822343; x=1791427143;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxM9bT7cYjfTboFQvHDwSX62x29YcBN8kbWxUGtmO+s=;
        b=REBULVEaKcUzK6pN16P/FQsPTG5GcH5/6G7rr+W+hLywJH09n+kz3EoJEzh4SwxaKk
         dT7bNoNcLEffmTb7Dv3dfkDqWP5999W0ddmuZMIafqcR/Ztt/LmwjQU7EB4IZJSFNnXw
         eUhmtvtIJQYk4U/uJivQAsvWRTdWbKrn2KOzTgjM7IsOFqVKCgiFF1fyYgzB7TKJ5yXy
         Mfqo5iG1nFXppIULg3yJ4ZTckfceEUi+aRIdfFRj7zvNenn+jELomsd6Apwtw7j/6bcp
         31nuq3HiOujrXJXeKVvOzRkAYlLbaEadmyaTUxejp+zmyLVeiiIq4c1CxUxe24AMhQ9y
         pLSA==
X-Forwarded-Encrypted: i=1; AKwUvBzqk6TpIRhLeF7j1nh8M7TWdvAZoH8lYojOV27EQubQkCiWYQq92ynUgxZfBXcg0b5OuAZzHYk+jPTAkQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLoOpi+WOpqN844ammKYONpJ46ZiI0ghFyE+O8SfOuAhV99c0tL
	NzyfgaJ1oSZi0cL4KMS+8sBXEcO+LGp4kOo4O5uxVcUUOR22iTAOgX59
X-Gm-Gg: AYBFou2AMld1NCPAOn7PrwV3cDRrnMfNwjomG0UwixqoRpf4DcGkVdpsB25wIZW4TEV
	kpVY4ZZsrsxE57GBno5mZ5H+6daSy/0Zf0IuL+Bw0epKwTwbtRUZbihIThxLC4/5gJpij8VtjjX
	GNPYajgwXLdMNBWITybqxkrxsSN8zannLUYep3p4omoVEhLV6ypPWuek+WwGaUTNRhcl7mkyZKQ
	Z75cN9EGA2fVJNj6Zay+LXH66m6F4o8JMnV4iql+GWb+B1/55zCI4jkkt41AfiSmCyHepCmRVIU
	QOedtfn3fUnxgazJ3sa0f/fMiBKyZkZFf5jD+6WpK8ePaVdjK0Eiv3J7iRGmSeB22ITq82olewB
	nKNJ12XNOmZvU1nLxHv51luMQaRkoJjNPyND43GKr5N13ceylLbTMxyq5r/Ty8sRgjLG9g7hTYw
	ucFt+Ri32H+myqilRou92LfxAhpLeja8xa53XuwbuhQvwGmNIY1OA2wpZeHznzp6gT5KAdFOTHr
	xgvMw6JtFzb0Fqi1C6CUTJVOOdbthkz49rIzZFYXV+JOp5i+O7J
X-Received: by 2002:a05:7301:468f:b0:346:7bfd:8504 with SMTP id 5a478bee46e88-34cdd98c9d9mr3520723eec.41.1790822342788;
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Received: from [192.168.68.59] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4c1ca89sm2351755eec.27.2026.09.30.19.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:39:02 -0700 (PDT)
Message-ID: <bd839c03-5cd7-48bf-91a7-c8dc51e5f6e5@gmail.com>
Date: Wed, 30 Sep 2026 19:39:01 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] qcom/qcom-msm8960-samsung-expressatt: SSH over USB
 no longer works
From: Rudraksha Gupta <guptarud@gmail.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>, Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Language: en-US
In-Reply-To: <8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/26 03:43, Rudraksha Gupta wrote:
> Hi all,
>
>
> I can no longer SSH in via USB. Reverting 
> dd0c03d685225cb8fc60c477417d1b9c3b05ba9d fixes the issue.
>
> Please see below on logs that I captured over UART (v7.3.0-rc5) and 
> USB (v7.3.0-rc5 + revert).
>
> Distro is Nura (formerly postmarketOS). Using head of 
> pmbootstrap/pmaports. Instructions for this device:
> https://wiki.nura.eco/wiki/Samsung_Galaxy_Express_SGH-I437_(samsung-expressatt) 
>
>
>
> Thanks,
> Rudraksha
>
>
> #regzbot introduced: dd0c03d68522


Hello all,


I have identified the culprit:

> CONFIG_USB_OTG_FSM=y

If (v7.3.0-rc5 + revert), then regardless of CONFIG_USB_OTG_FSM, SSH 
over USB works.

If (v7.3.0-rc5), then CONFIG_USB_OTG_FSM cannot be set to y. It must be 
not set.


Thanks,

Rudraksha


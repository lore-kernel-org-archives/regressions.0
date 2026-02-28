Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DDD1DE2C9
	for <regressions@lists.linux.dev>; Sat, 28 Feb 2026 00:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237996; cv=none; b=pp7fFZKJMN/iI9qutrScKb5rTUg/4NF/FWauKMndazmiUsehG2NN2/3/kUY65XBIhhN+JZg/tVIeU4aoFKgUf7mZI3MA2yImI3uj5f3I2FNhkRz0tASaRBPEeYF/wTNxJNhjx7Qc57uFiwjb7ouyWCNh1c8aN2ll85OXpziFngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237996; c=relaxed/simple;
	bh=eEWOJLC5iXka6AARlFgyl+EPvoGlADG4k4kYulrx3Wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=emiQXxGZcp7/GCY1NNXOdOWwVoaRgqlSib9pVi22Q3xntJAFxmQ0Sgj/sBAe3nKH5NYlf7jL36C2X3m5oEF+9t1ebRWuoq7dLyFjD28IsEGibcJlbMqzhtm/TV7AakQXQsm/WSaujYNOKuGOh4vdcmAFpxzfKbd6BkPSrZHvv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YG1S4cQC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YG1S4cQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772237993;
	bh=eEWOJLC5iXka6AARlFgyl+EPvoGlADG4k4kYulrx3Wc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YG1S4cQCItG4wh33BA/xp5pv5bzJWN7qr+2SrhcDxWdw1eOTsEa0xeOMT981QtdVj
	 LDEbrpqeDNXAa3A1OAI05M1LKnMzVP74y/de7yGLlGybv8g6gTbGLMJE/eWpXUwaFl
	 Xp+GYqK9CWyxjl3FZQ+kGEVpyDf8r0Wa0CM0Xhy64iADAgGEevXUxO/2GWtwfhejJa
	 N7IQmVGUvlsh3fbT2UN3oEg3tWCsqSQBxc5d+RXTYTU36p/aVJV1l+eLJJt1KjUM73
	 BhUhf7F3p5s/8ZRDu4ba6RSlCNs4E2wShG1B9ig1HZSntqeCTa/jxlgnPHLqCxSyQj
	 Sy2rRpetH1djw==
Received: from [192.168.1.90] (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5457D17E0454;
	Sat, 28 Feb 2026 01:19:53 +0100 (CET)
Message-ID: <67adf0fb-707f-4cc9-b394-8627149d8587@collabora.com>
Date: Sat, 28 Feb 2026 02:19:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
 <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
 <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
 <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
 <a662745a-1b2a-47b3-a66d-7c1c5c8af525@collabora.com>
 <e18fce6a3216427d26bd10ebd837e9152c0c8b60.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <e18fce6a3216427d26bd10ebd837e9152c0c8b60.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Thomas,

On 2/21/26 5:05 PM, Thomas Niederprüm wrote:
> Hi Cristian,
> 
> Am Mittwoch, dem 18.02.2026 um 22:56 +0200 schrieb Cristian Ciocaltea:
>> Hi Thomas,
>>
>> On 2/18/26 10:43 PM, 1und1 wrote:
>>> Hi Cristian,
>>>
>>>
>>> Am Mittwoch, dem 18.02.2026 um 22:15 +0200 schrieb Cristian Ciocaltea:
>>>> On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
>>>>> On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
>>>>>> Hi Thomas,

[...]

>>> applying these commits solves my problems. I tested 1920x1080@60,
>>> 1920x1080@50
>>> and 1920x1080@30. All work now. Thanks for the quick fix! 
>>
>> Thanks for the quick test!
>>
>> I can add you to cc: when I submit the series, so that you may provide your
>> Tested-by tag if you'd like to.
> 
> sure, I would be happy to.

I've just realized I missed to add your recipient email to the series [1] sent
out just a few hours ago - sorry for that.  However, you can find some reply
instructions at the bottom of that page, e.g. import the mbox into your mail
client.

Please note this is a reworked version of the initial patches, fixing some
additional issues, hence retesting would be necessary.  For convenience, you may
also pick these patches from [2].

Regards,
Cristian

[1] https://lore.kernel.org/all/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com/
[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/b4/hdptx-clk-fixes

Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2B9143755
	for <regressions@lists.linux.dev>; Tue,  4 Jun 2024 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507451; cv=none; b=GwsEfSHecTw1TdNp0/bfR3EYfx/tDl1uQ4/np1VjeYeVlbjby+89mhNz7J4+eEOniUypo3XeZQQ9+OXpRl8Xv0XIL9OPQuCY5aD4sFbr2/q4z7fuj+pdTnAmbabyfAQWMtr5qIPQIo47t2KdGSRrq9um2MlJIKWrzeaqP2N7ues=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507451; c=relaxed/simple;
	bh=cupXqcFF9fa59A9+cgbWg+iQop5ZvtZxHIDzCVlCOgA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uJszX0MNlzz7Jl25rhlic1xQmu4vbLs6q4WNLoLpBHE+GM1Zo0t+rXECpECUCe5484TYPTpONlAjq77OdK2/Oi1BLsVNh7uQ/QV6+I6tnOdhXazuorlzSSKSm+lB2ctBpc2KNrzhsFW7uCCct73sadDQuQNSI0axJb7L2IJo4qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S/Lj+JzM; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S/Lj+JzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:
	Content-Type; bh=t+6uf2ZT2trzXSMZhwTL2CGLO411ioJ/4VBZBE+VM2w=;
	b=S/Lj+JzMfHO2B96kre5fWy+jA8lN2dNCKjWdqrgjZYYZJ8LCCsshDbmtnecPTE
	dOY24mCAwjbsbC1NSWbYOooxaJ30/kC6UyoExdy5ZuwxfveCLCmrIsPYjUAo5B1d
	OTt3cFGNz824lODk6cx14SCaGTLLl3jgRaOTjmf5unKps=
Received: from [192.168.1.26] (unknown [183.195.6.89])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDHHyZjFV9muQnjBw--.50874S2;
	Tue, 04 Jun 2024 21:23:48 +0800 (CST)
Message-ID: <00c2798f-61d7-437e-8c12-e2872f4c2bc4@163.com>
Date: Tue, 4 Jun 2024 21:23:46 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Lk Sii <lk_sii@163.com>
Subject: Re: [PATCH v2] Bluetooth: qca: Fix BT enable failure again for
 QCA6390 after warm reboot
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <quic_zijuhu@quicinc.com>, luiz.von.dentz@intel.com,
 marcel@holtmann.org, linux-bluetooth@vger.kernel.org, wt@penguintechs.org,
 regressions@lists.linux.dev, pmenzel@molgen.mpg.de,
 krzysztof.kozlowski@linaro.org, stable@vger.kernel.org
References: <1715866294-1549-1-git-send-email-quic_zijuhu@quicinc.com>
 <f343ecae-efee-4bdc-ac38-89b614e081b5@163.com>
 <CABBYNZ+nLgozYxL=znsXrg0qoz-ENgSBwcPzY-KrBnVJJut8Kw@mail.gmail.com>
 <34a8e7c3-8843-4f07-9eef-72fb1f8e9378@163.com>
 <CABBYNZLzTcnXP3bKdQB3wdBCMgCJrqu=jXQ91ws6+c1mioYt9A@mail.gmail.com>
 <f7a408b4-ccef-4a4c-a919-df501cf3e878@163.com>
 <ca7adc9d-9df3-4050-8943-3c489097b995@163.com>
 <CABBYNZJwPr_1u+NYnAVaPOd+Wkrb9Jz40hjWF_8v6p6tTaZjtg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CABBYNZJwPr_1u+NYnAVaPOd+Wkrb9Jz40hjWF_8v6p6tTaZjtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHHyZjFV9muQnjBw--.50874S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa5ETUUUUU
X-CM-SenderInfo: 5onb2xrl6rljoofrz/1tbiEwjzNWXAldQ0eQAAs0



On 2024/6/4 03:27, Luiz Augusto von Dentz wrote:
> Hi,
> 
> On Thu, May 30, 2024 at 9:34 AM Lk Sii <lk_sii@163.com> wrote:
>> @Luiz:
>> do you have any other concerns?
>> how to move forward ?
> 
> Well I was expecting some answer to Krzysztof comments:
> 
> No, test it on the mainline and answer finally, after *five* tries, which
> kernel and which hardware did you use for testing this.
> 
That is wonderful, let us solve Krzysztof's concerns containing above
one mentioned.


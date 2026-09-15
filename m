Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9175540F743
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467086; cv=none; b=qx+Em0FDHeEcq9bKYgKdPnSywGNEi3GEzRGTWZufK69zvsTWLD2VPbh/tG1rPzenlpfa9JqT1E5YxsWU9xmzoE3YTDXbgampLtrPl6kEmUuKY65uJCVKT2eO/oGdC2laaDY5oJ+dHY0kZZW5msV+Qk1ZQwQjlXiN7lkhP1cSRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467086; c=relaxed/simple;
	bh=3A11Je4xZf8841M0gdOA4/nlkkErzXWi3HPLVU0/0LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QTbkV8X+xJbzt/ML13vY5D67Kyoczf/s5XNdNNKnP/O/ma5jxSLXR1mTiwFrWs7++Op1sr3uvwqnNs0LD/uOU4umNd0zpGZMLNwyuYbyoyp30XC/pNTvvDC2H2DQuEFZdq6+WhPu6J1BYPEuVq0nKLI3SHZVjzfgYrVsmsunwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R5VDsDjs; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R5VDsDjs"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b4ba7fe26so1588055e9.2
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789467083; x=1790071883; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mkp4/wKZXD3uenxBisrMtNjucgS6f3bitOkqBmF1Axo=;
        b=R5VDsDjsiEeXxpk6y/l1MAZeMwCUUom1fXBefQQUssJsYynvQwXbaLf6fPmETHaGTm
         3ta1wST34Hfj2fjh4+gNNn4Nx0RQHDFFnN4gh5yCcsqaQVtzKLl4bcRXRAWu788BMpD4
         XqRFMyi9wspb39ipOC0DT+mQnhN9yBU70HKOiQPQ8USblclO38SXzxMtwWOgEHLDsrAQ
         5UqcMqlUjcWfjuIGeueOBRG6LKl4OuuArxsc0V4yIMZ+Ue2RNjDzl5BldM0aA6lvbSfl
         dJXia2vnbnA34BPMSRimI3Enrw3B+6s6d+6GPod8PR/H442hmRaEPfksZjExOCoNzrjL
         5cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467083; x=1790071883;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mkp4/wKZXD3uenxBisrMtNjucgS6f3bitOkqBmF1Axo=;
        b=ameA3Mfleaw8cG9POa7VMdjv6b59LnXrNC19GrSQyx+D21FAOFSHWbfN3SZQKZVREf
         f3f4R6sI9U8L1Avrw6t0LXcQ99vUaThY1MwrsJ2ePwjaUaLnaYGdGq6oouMuDpQSFsd0
         DmXwEyePqdx4VhTm/GM9UgIyyhPLGF0KQsJ4BdXuRiEv/3yI0EmzLOX9zCAl9a2VX+MS
         q7Nz39MDWU4QVURwq+iFjMtDmT/dkIDAPYvBBe5FE8bsc3qEA3JK4rhuTPxyUgH1cr3X
         GNfo2itABfxRR4VAI39JwibAV59C1RgN+Q7wyJAgnK218xb7ORo3+1tBlN7ZDaN8hud+
         CRcw==
X-Forwarded-Encrypted: i=1; AKwUvBzqSR7gjg3J0+OPD4WRqVfTVS8S3jhh1f90ZzOA5dnp8h2zP4pFUWlu0Vrh19dAco6X9d57rsJHji7BKA==@lists.linux.dev
X-Gm-Message-State: AFuF++lwnhlPQaR5wGfkOF+jzM8fwmg8sre3yPTQJNxjBizn52VqJYcH
	b8v/Lvsew9mttjUNU/amcMZelW7vUZ0F1Xh3dinLJmAKxwArKd2hVC4L/PxQQL63J4g=
X-Gm-Gg: AYBFou04C9hg5DnlrKjmitK4v6edLQpkhFXraLhhlCtW9xhbYI9aLt9F01C55yURHt2
	47qOoemU0gVlddAdMmuR3f2VuXZ5hK+6ousDuQBe8tWwV4FJtSVg1QbUrqfuoZJfEWVlet7+bFn
	ehl0Dk0JoBrh8hNyWTUc5EqH8tnfVWsZyz7aH2Qy4gHIJo2gmeU6fsB6Xh4Z1PiweXADUfngw6Y
	x4+nRilwG8Z75fhM5b623yC8KYiRl1j+Lg0sLXYm9MvRoLAs2e0Wl5hPUB+EXKUJbcAl6hT92Yx
	Jkv+AxD28HYrwKbUAX1GzhQV3VVvA45VS3h4ggwHbVBkhJP3hlklxzf/EkPIlKTRktDfSGmjyVx
	mpKYf6VLxSUQcZm1JkPqXZF1TqwhYbYWzMTlNvWSB3IV0GnZ5JSSm8TuA0XRHTbxaqNnNPY1gge
	RLUWwSRkXYKnj7rGGmX9FuvWJebXR8J05YliEHvzThmK0uUYfOf9G6QErkL3P4DHe8+Q==
X-Received: by 2002:a05:600c:4e53:b0:49c:ff81:e062 with SMTP id 5b1f17b1804b1-49e7a68b774mr72695915e9.2.1789467081857;
        Tue, 15 Sep 2026 03:11:21 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903::e14? ([2001:1a48:8:903::e14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d695677sm60344685e9.5.2026.09.15.03.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 03:11:21 -0700 (PDT)
Message-ID: <ab1491bb-cca5-4145-ac7d-31c966abf7b4@suse.com>
Date: Tue, 15 Sep 2026 12:11:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Daniel J Blueman <daniel@quora.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Chris Lew <christopher.lew@oss.qualcomm.com>,
 Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
 Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Takashi Iwai <tiwai@suse.de>
References: <20260909055846.16539-1-daniel@quora.org>
 <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
From: Vlastimil Babka <vbabka@suse.com>
Autocrypt: addr=vbabka@suse.com; keydata=
 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
 pYekxJujNeEDkUlky0Y=
In-Reply-To: <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 11:04, Thorsten Leemhuis wrote:
> On 9/9/26 07:58, Daniel J Blueman wrote:
>> Since the MHI HELLO exchange was relocated, it is sent only at device
>> registration. During a suspend-resume cycle, the firmware in WiFi
>> cards such as WCN7850 indefinitely waits for another HELLO,
>> triggering:
>> 
>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>> 
>> Fix this by triggering the handshake from resume_early in the MHI
>> transport.
>> 
>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>> suspend-resume cycles.
> 
> For the record: Takashi ran into this regression as well and provided a
> different fix, but withdrew it after I pointed out this fix, which
> worked for Takashi. For details see:
> https://lore.kernel.org/all/87mrtkpd2q.wl-tiwai@suse.de/

Thanks to Thorsten pointing me there I skipped the bisect and applied this
patch instead and it works.

My laptop is T14s AMD Gen3 with ath11k_pci. Since rc2 the wifi would stop
working on suspend/resume, making the resume freeze for a while (I initially
thought it was frozen completely and was shutting off the laptop).

Interestingly the card doesn't recover after reboot, but only after a full
power off/on cycle. But if the HELLO handshake is sent after a boot,
shouldn't it recover? Maybe the hardware gets too confused to recover.
Dunno. Hm maybe I can try if 7.2 kernel (and/or 7.3 with this patch)
recovers it without poweroff/on after a 7.3 without this patch
suspend/resume wedges it.

But anyway this prevents the suspend/resume issue for me from happening in
the first place on 7.3-rc3, so:

Tested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> 
> Ciao, Thorsten
>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>> ---
>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>  net/qrtr/mhi.c     | 10 +++++++++-
>>  net/qrtr/qrtr.h    |  2 ++
>>  3 files changed, 24 insertions(+), 1 deletion(-)
>> 
>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>> index 78347c937af7..2ffcfc2fdb4a 100644
>> --- a/net/qrtr/af_qrtr.c
>> +++ b/net/qrtr/af_qrtr.c
>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>  	qrtr_port_put(ctrl);
>>  }
>>  
>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
>> +{
>> +	struct qrtr_node *node = ep->node;
>> +
>> +	mutex_lock(&node->ep_lock);
>> +	node->hello_sent = false;
>> +	mutex_unlock(&node->ep_lock);
>> +
>> +	schedule_delayed_work(&node->say_hello, 0);
>> +}
>> +EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
>> +
>>  /**
>>   * qrtr_endpoint_register() - register a new endpoint
>>   * @ep: endpoint to register
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 3990da1a65dc..50326ffa3401 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
>>  static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>>  {
>>  	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
>> +	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
>>  	enum mhi_state state;
>>  	int rc;
>>  
>> @@ -201,7 +201,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>>  		return rc;
>>  	}
>>  
>> -	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
>> +	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	qrtr_endpoint_hello(&qdev->ep);
>> +
>> +	return 0;
>>  }
>>  
>>  static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
>> diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
>> index 3f2d28696062..de2de69a6199 100644
>> --- a/net/qrtr/qrtr.h
>> +++ b/net/qrtr/qrtr.h
>> @@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
>>  
>>  void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
>>  
>> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
>> +
>>  int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
>>  
>>  int qrtr_ns_init(void);


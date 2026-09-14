Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108313F65EF
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376850; cv=none; b=nuJ3pGpUkJNbzIvQRspQ8XUTNB+SvJ+Vh/2qArWEBXFc7eJFDbCJHK9wMBmoqxLA5b7xcrxp//QC7mFqxcR14gE+JFPkQcwHbIz1yAsb1Dxp9NvY14/+w8xjUhYxM78rqAzY0o4RDKy5UJH9587g+jzrm12drgkVVbZYAuM99cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376850; c=relaxed/simple;
	bh=engjEc2gudsArVMmNEJz5z41HqqXgHRqILp5st5A2Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocyRZ1VK+ASyIC8JebhrC3PFVXsIT43x+hdR/DZs2KlBu+JOONnJvdpr+Pushhg6zVs7hNnQJ4BC8mRQJ+/6BwNg1Z3PTjPbTcKWDda1bCi4MxDuliVfcjK0AFhUXTtNpGGQkmtigZuAg0exvuy7bUZw2p9T7LKSKk5toEfV/t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=G8gXagL0; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="G8gXagL0"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hjzlL5BWpz4BQm;
	Mon, 14 Sep 2026 11:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789376750;
	bh=engjEc2gudsArVMmNEJz5z41HqqXgHRqILp5st5A2Ko=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G8gXagL0Jnv4nNdUyybM7/GNJS2GAfoBc5w5jTI2Y83sT6R3ACO80LG6cpaw5x0D7
	 VyyjDMkwjWEpMJaqf515RWBHU4OqoDgGbuRmYyqIqszv39YbpjnPly32Mygzctj4IO
	 Ro3Zo5mtF5+fOV4PYiJiTikrfbz/JOQ7bZl5jLLDIo//8LopqAcVw4Pxo5u6UbhlQn
	 SDgQkXg/U3fMGCubwV96HJIOk40/QCtTXXfajM9Qtw+o7N2G9W7HbY4+rfq9/dWSUr
	 kZXTsvo2tulhjjeHYVZUS8cZKygBuAdlH16mA4Xt3pN888GbtFjxkOP3E7z9bgzloZ
	 MwOrRrkuM/s2g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4hjzjv1NBRz7yxL;
	Mon, 14 Sep 2026 11:04:35 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hjzjt0ywRz8sbC;
	Mon, 14 Sep 2026 11:04:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 58F815F9D8;
	Mon, 14 Sep 2026 11:04:27 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <260eee02-29d3-478f-9a39-d67adfefe862@leemhuis.info>
Date: Mon, 14 Sep 2026 11:04:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Daniel J Blueman <daniel@quora.org>,
 Manivannan Sadhasivam <mani@kernel.org>
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260909055846.16539-1-daniel@quora.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178937666798.1427810.11433211726485551189@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 58F815F9D8
X-NC-CID: T+F9yzsBemWHL7da7K3H05tvnUG+n+nUAdOdPPCfRe+q7OZ3MhQ=

On 9/9/26 07:58, Daniel J Blueman wrote:
> Since the MHI HELLO exchange was relocated, it is sent only at device
> registration. During a suspend-resume cycle, the firmware in WiFi
> cards such as WCN7850 indefinitely waits for another HELLO,
> triggering:
> 
>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
> 
> Fix this by triggering the handshake from resume_early in the MHI
> transport.
> 
> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
> suspend-resume cycles.

For the record: Takashi ran into this regression as well and provided a
different fix, but withdrew it after I pointed out this fix, which
worked for Takashi. For details see:
https://lore.kernel.org/all/87mrtkpd2q.wl-tiwai@suse.de/

Ciao, Thorsten
> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> ---
>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>  net/qrtr/mhi.c     | 10 +++++++++-
>  net/qrtr/qrtr.h    |  2 ++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
> index 78347c937af7..2ffcfc2fdb4a 100644
> --- a/net/qrtr/af_qrtr.c
> +++ b/net/qrtr/af_qrtr.c
> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>  	qrtr_port_put(ctrl);
>  }
>  
> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep)
> +{
> +	struct qrtr_node *node = ep->node;
> +
> +	mutex_lock(&node->ep_lock);
> +	node->hello_sent = false;
> +	mutex_unlock(&node->ep_lock);
> +
> +	schedule_delayed_work(&node->say_hello, 0);
> +}
> +EXPORT_SYMBOL_GPL(qrtr_endpoint_hello);
> +
>  /**
>   * qrtr_endpoint_register() - register a new endpoint
>   * @ep: endpoint to register
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 3990da1a65dc..50326ffa3401 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -183,6 +183,7 @@ static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
>  static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>  {
>  	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
> +	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
>  	enum mhi_state state;
>  	int rc;
>  
> @@ -201,7 +201,13 @@ static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>  		return rc;
>  	}
>  
> -	return qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
> +	rc = qcom_mhi_qrtr_queue_dl_buffers(mhi_dev);
> +	if (rc)
> +		return rc;
> +
> +	qrtr_endpoint_hello(&qdev->ep);
> +
> +	return 0;
>  }
>  
>  static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
> diff --git a/net/qrtr/qrtr.h b/net/qrtr/qrtr.h
> index 3f2d28696062..de2de69a6199 100644
> --- a/net/qrtr/qrtr.h
> +++ b/net/qrtr/qrtr.h
> @@ -27,6 +27,8 @@ int qrtr_endpoint_register(struct qrtr_endpoint *ep, unsigned int nid);
>  
>  void qrtr_endpoint_unregister(struct qrtr_endpoint *ep);
>  
> +void qrtr_endpoint_hello(struct qrtr_endpoint *ep);
> +
>  int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len);
>  
>  int qrtr_ns_init(void);


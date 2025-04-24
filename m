Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A094274FD8
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508927; cv=none; b=F2IsSjAD84Z/H1zxYthYSzVfDtgrGgKqPAPhEDUzpH5+LPLcIZ0BOq3vXHfRp+PCSvGE8LCg8MMKrMwPErbR+J7ZuA70MvvP+dVIOlFCjkOrzX/tBaO/lzsQZ0Ef6JuTc8GibTsout6TJgwAeNnA94W3ZHUyzTLmm2waaOSUWWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508927; c=relaxed/simple;
	bh=uulvpoNlf0v9TkT+QqAhQUPMpAvCv5DHfTKEnGdy3Xk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oFnFay788TI1KIPRa3s+Ie8nRMZbxKAzYsDu9qa3dSI6ZkoNwzreJD5d0sjOD1g+egERnM7rEvH1UIRB7DlKURrSPjCBE6BuYCAOsVgEBNyD92YHkh7q9+2v6vpAgOQg0Z9ZHLkq3qCtKZlBZIB6aafxTVRBqvmC3PAP7qMX5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hD59rwR0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hD59rwR0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so6106165e9.2
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745508923; x=1746113723; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90J0ZmCW6/hQg6wXxjTUSHJn5hh8V/UVJ5EmPQBXgjk=;
        b=hD59rwR0R4yA16jd28fMMHlfYJuXsAyFvMVVpkfXdA7bY4I3jhk3pdHSXjqlBHIi8U
         ckXDh6zTbnmRaPxPqzWjmfas9Hm6NARZgkLxdIjApD60Y9O8Fb8FN0Ix/qgve20SCI1+
         I04y/9quv/d1cD4UBlTH3li2dv/liVNMHxmAD/Jl6DNIcPcWdGTGcYjTC7Fw7zMIBC8f
         ABuuTIZaNp9KduTa00ULC3XGTT+jPYxpCH9tMDDj/+zSBaIyDZEExKzceDS9pr1L6r7e
         ce1KqWyK/XcmbfM+EQh8WzL36JwzykrbKLBRBS0wUXdhT39n5nopqgPAZUDclWn/Qubv
         dF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508923; x=1746113723;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=90J0ZmCW6/hQg6wXxjTUSHJn5hh8V/UVJ5EmPQBXgjk=;
        b=f+1ulv/Kk5msQK9YWcC/IHreVsvAPBB31Oq1/G5tNQrUQKIFC5f+/fvvwtblFa+Nb+
         tRqXE59z0nTzNr6GK6YoIRqDP3kZtxgX9507r5VGGuAyHAvTzB0IOOcXpIC72GikGA//
         gHmribeoLmAoH9Mn8imL/0rY6yikbICEyhj91xkHMsteQf9ZyfqitxT+6TJCf7NbhPvX
         ezdmNYtWnUjHzNJOXSDHoj0vxb0Bq4rcAmFv2XbCPwGn9W+aqVX44EhBrWYkG5hIZDSn
         uR10x+dBkEMAdwdSQ4WF6rWTQBEo3ZXbhd0uDurLbFEuvm3vRbqDbW1l1Uvj2efSskMb
         6Cqg==
X-Forwarded-Encrypted: i=1; AJvYcCVFI5wgpKr6aPUu8hNGZMfbPCtbpgZa4KeZ5Li6QE/eqNInG+3GmAviyVvZNEOFWiuBN23Lq+gHhGyY6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmegzYxSI9qW+gHZO1+XWegGkuovn/UTnhYdSsTTLOK5kz0UjL
	kzhFp78us0LlwwjVxZBgUl7BDf9iIUBLMy2nXPuIOVrNn278JbE5E6rKAPkKU7M=
X-Gm-Gg: ASbGncu8q8eW8fusBO9cqSu5iVwlOv6kiVuiKKru7H9Rbmol4Z14cSosb2mZUv677M8
	E2Fsl1H5OsDlAfXC2zwGoD3PZxq4+W1dDlPRJL5COHX8N2JEfDv7LeD3m2nPAav/Men+v8H8Yoy
	547xezFTfTMDn2U4VRl+GHEvoyJrZIHpPD7kdJAJQxIQezDgQViicVQEEJLbCoMO85C1QCmRT/s
	bvSQAeM2IHVYG/mbRygbYNq7XJGSJBsNNjiGD6R9dnINrzYS4vneDYLpZXY0a1kLWZPdvnaybK7
	g/SS4UIIKgcUlzXuTUjlHxhqek+h/XmX/rlN8wnrizDejzW16BjmEni75FUIgpTjrqzoujrj1cn
	ZI/0xNsdNR0XjItqMtw==
X-Google-Smtp-Source: AGHT+IGTwz+l2hU3W5oB/SMKYK5pobundB5Y5e3EUt8oWYelt7IXQZcpTS1d1RGvuuIScs225N7JYQ==
X-Received: by 2002:a05:600c:4e14:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-4409bd324ffmr33081305e9.18.1745508923253;
        Thu, 24 Apr 2025 08:35:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:a24a:bfda:f031:720d? ([2a01:e0a:3d9:2080:a24a:bfda:f031:720d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29b990sm27036615e9.4.2025.04.24.08.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 08:35:22 -0700 (PDT)
Message-ID: <c7f2476a-943a-4d73-ad80-802c91e5f880@linaro.org>
Date: Thu, 24 Apr 2025 17:35:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 peter.wang@mediatek.com, quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20250213080008.2984807-1-quic_ziqichen@quicinc.com>
 <20250213080008.2984807-6-quic_ziqichen@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250213080008.2984807-6-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/02/2025 09:00, Ziqi Chen wrote:
> From: Can Guo <quic_cang@quicinc.com>
> 
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropriate gear speeds accordingly.
> 
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> 
> v1 -> v2:
> Rename the lable "do_pmc" to "config_pwr_mode".
> 
> v2 -> v3:
> Use assignment instead memcpy() in function ufshcd_scale_gear().
> 
> v3 -> v4:
> Typo fixed for commit message.
> 
> v4 -> v5:
> Change the data type of "new_gear" from 'int' to 'u32'.
> ---
>   drivers/ufs/core/ufshcd.c | 44 ++++++++++++++++++++++++++++++---------
>   1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 8d295cc827cc..9908c0d6a1e1 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1308,16 +1308,26 @@ static int ufshcd_wait_for_doorbell_clr(struct ufs_hba *hba,
>   /**
>    * ufshcd_scale_gear - scale up/down UFS gear
>    * @hba: per adapter instance
> + * @target_gear: target gear to scale to
>    * @scale_up: True for scaling up gear and false for scaling down
>    *
>    * Return: 0 for success; -EBUSY if scaling can't happen at this time;
>    * non-zero for any other errors.
>    */
> -static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
> +static int ufshcd_scale_gear(struct ufs_hba *hba, u32 target_gear, bool scale_up)
>   {
>   	int ret = 0;
>   	struct ufs_pa_layer_attr new_pwr_info;
>   
> +	if (target_gear) {
> +		new_pwr_info = hba->pwr_info;
> +		new_pwr_info.gear_tx = target_gear;
> +		new_pwr_info.gear_rx = target_gear;
> +
> +		goto config_pwr_mode;
> +	}
> +
> +	/* Legacy gear scaling, in case vops_freq_to_gear_speed() is not implemented */
>   	if (scale_up) {
>   		memcpy(&new_pwr_info, &hba->clk_scaling.saved_pwr_info,
>   		       sizeof(struct ufs_pa_layer_attr));
> @@ -1338,6 +1348,7 @@ static int ufshcd_scale_gear(struct ufs_hba *hba, bool scale_up)
>   		}
>   	}
>   
> +config_pwr_mode:
>   	/* check if the power mode needs to be changed or not? */
>   	ret = ufshcd_config_pwr_mode(hba, &new_pwr_info);
>   	if (ret)
> @@ -1408,15 +1419,19 @@ static void ufshcd_clock_scaling_unprepare(struct ufs_hba *hba, int err, bool sc
>   static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
>   				bool scale_up)
>   {
> +	u32 old_gear = hba->pwr_info.gear_rx;
> +	u32 new_gear = 0;
>   	int ret = 0;
>   
> +	new_gear = ufshcd_vops_freq_to_gear_speed(hba, freq);
> +
>   	ret = ufshcd_clock_scaling_prepare(hba, 1 * USEC_PER_SEC);
>   	if (ret)
>   		return ret;
>   
>   	/* scale down the gear before scaling down clocks */
>   	if (!scale_up) {
> -		ret = ufshcd_scale_gear(hba, false);
> +		ret = ufshcd_scale_gear(hba, new_gear, false);
>   		if (ret)
>   			goto out_unprepare;
>   	}
> @@ -1424,13 +1439,13 @@ static int ufshcd_devfreq_scale(struct ufs_hba *hba, unsigned long freq,
>   	ret = ufshcd_scale_clks(hba, freq, scale_up);
>   	if (ret) {
>   		if (!scale_up)
> -			ufshcd_scale_gear(hba, true);
> +			ufshcd_scale_gear(hba, old_gear, true);
>   		goto out_unprepare;
>   	}
>   
>   	/* scale up the gear after scaling up clocks */
>   	if (scale_up) {
> -		ret = ufshcd_scale_gear(hba, true);
> +		ret = ufshcd_scale_gear(hba, new_gear, true);
>   		if (ret) {
>   			ufshcd_scale_clks(hba, hba->devfreq->previous_freq,
>   					  false);
> @@ -1723,6 +1738,8 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
>   		struct device_attribute *attr, const char *buf, size_t count)
>   {
>   	struct ufs_hba *hba = dev_get_drvdata(dev);
> +	struct ufs_clk_info *clki;
> +	unsigned long freq;
>   	u32 value;
>   	int err = 0;
>   
> @@ -1746,14 +1763,21 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
>   
>   	if (value) {
>   		ufshcd_resume_clkscaling(hba);
> -	} else {
> -		ufshcd_suspend_clkscaling(hba);
> -		err = ufshcd_devfreq_scale(hba, ULONG_MAX, true);
> -		if (err)
> -			dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
> -					__func__, err);
> +		goto out_rel;
>   	}
>   
> +	clki = list_first_entry(&hba->clk_list_head, struct ufs_clk_info, list);
> +	freq = clki->max_freq;
> +
> +	ufshcd_suspend_clkscaling(hba);
> +	err = ufshcd_devfreq_scale(hba, freq, true);
> +	if (err)
> +		dev_err(hba->dev, "%s: failed to scale clocks up %d\n",
> +				__func__, err);
> +	else
> +		hba->clk_scaling.target_freq = freq;
> +
> +out_rel:
>   	ufshcd_release(hba);
>   	ufshcd_rpm_put_sync(hba);
>   out:

This change causes UFS crash on the RB3gen2, after UFS successfully probe and scan:

[    9.383728] ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x2 with mode 0x11 completion timeout
[    9.393272] ufshcd-qcom 1d84000.ufshc: UFS Host state=1
[    9.403126] msm_dpu ae01000.display-controller: [drm:adreno_request_fw [msm]] *ERROR* failed to load a660_sqe.fw
[    9.408484] ufshcd-qcom 1d84000.ufshc: 0 outstanding reqs, tasks=0x0
[    9.425577] ufshcd-qcom 1d84000.ufshc: saved_err=0x0, saved_uic_err=0x0
[    9.432433] ufshcd-qcom 1d84000.ufshc: Device power mode=1, UIC link state=1
[    9.439716] ufshcd-qcom 1d84000.ufshc: PM in progress=0, sys. suspended=0
[    9.446742] ufshcd-qcom 1d84000.ufshc: Auto BKOPS=0, Host self-block=0
[    9.453468] ufshcd-qcom 1d84000.ufshc: Clk gate=1
...
[   10.529259] ufshcd-qcom 1d84000.ufshc: ufshcd_change_power_mode: power mode change failed -110
[   10.538102] ufshcd-qcom 1d84000.ufshc: ufshcd_scale_gear: failed err -110, old gear: (tx 1 rx 1), new gear: (tx 4 rx 4)
[   10.542841] WARNING: CPU: 0 PID: 274 at drivers/ufs/core/ufshcd.c:5504 ufshcd_sl_intr+0x64c/0x6a4
...

CI Run sample: https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/233352#L1479

Bisect run log:
# bad: [0af2f6be1b4281385b618cb86ad946eded089ac8] Linux 6.15-rc1
# good: [38fec10eb60d687e30c8c6b5420d86e8149f7557] Linux 6.14
git bisect start 'v6.15-rc1' 'v6.14'
# bad: [fd71def6d9abc5ae362fb9995d46049b7b0ed391] Merge tag 'for-6.15-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
git bisect bad fd71def6d9abc5ae362fb9995d46049b7b0ed391
# good: [fb1ceb29b27cda91af35851ebab01f298d82162e] Merge tag 'platform-drivers-x86-v6.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
git bisect good fb1ceb29b27cda91af35851ebab01f298d82162e
# good: [1952e19c02ae8ea0c663d30b19be14344b543068] Merge tag 'wireless-next-2025-03-20' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next
git bisect good 1952e19c02ae8ea0c663d30b19be14344b543068
# bad: [1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95] Merge tag 'net-next-6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next
git bisect bad 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
# good: [22093997ac9220d3c606313efbf4ce564962d095] Merge tag 'ata-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/libata/linux
git bisect good 22093997ac9220d3c606313efbf4ce564962d095
# bad: [336b4dae6dfecc9aa53a3a68c71b9c1c1d466388] Merge tag 'iommu-updates-v6.15' of git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux
git bisect bad 336b4dae6dfecc9aa53a3a68c71b9c1c1d466388
# bad: [0711f1966a523d77d4c5f00776a7bd073d56251a] scsi: mpt3sas: Fix buffer overflow in mpt3sas_send_mctp_passthru_req()
git bisect bad 0711f1966a523d77d4c5f00776a7bd073d56251a
# good: [369552fd03f296261023872b8fc983d1fc55c8e9] Merge patch series "mpt3sas driver udpates"
git bisect good 369552fd03f296261023872b8fc983d1fc55c8e9
# bad: [42273e893157501ae119ea5459f3a7d2420c56d6] Merge patch series "scsi: scsi_debug: Add more tape support"
git bisect bad 42273e893157501ae119ea5459f3a7d2420c56d6
# bad: [7e72900272b61c11f2fd4020d4f186124d0d171b] Merge patch series "Support Multi-frequency scale for UFS"
git bisect bad 7e72900272b61c11f2fd4020d4f186124d0d171b
# good: [c02fe9e222d16bed8c270608c42f77bc62562ac3] scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
git bisect good c02fe9e222d16bed8c270608c42f77bc62562ac3
# bad: [eff26ad4c34fc78303c14be749e10ca61c4d211f] scsi: ufs: core: Check if scaling up is required when disable clkscale
git bisect bad eff26ad4c34fc78303c14be749e10ca61c4d211f
# bad: [129b44c27c8a51cb74b2f68fde57f2a2e7f5696b] scsi: ufs: core: Enable multi-level gear scaling
git bisect bad 129b44c27c8a51cb74b2f68fde57f2a2e7f5696b
# first bad commit: [129b44c27c8a51cb74b2f68fde57f2a2e7f5696b] scsi: ufs: core: Enable multi-level gear scaling

#regzbot introduced 129b44c27c8a51cb74b2f68fde57f2a2e7f5696b

Thanks,
Neil


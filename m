Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4FF2FB0A9
	for <regressions@lists.linux.dev>; Mon,  3 Nov 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762163509; cv=none; b=hLCEI+nOsLk6Ydm6VRy7Bk3aE9qtGWWjvMbAtWQwaISvc0czrDDxJwAJisKKq2pqMkdj9LCGQjQ9kxUmoBsikUh8Tv9XGG4a0j+6xlmsRtYLIQDZTevENdLnE4W7tz12Y5uorVBJ0RS+6QEtwBG42mfl5AO2ZoWcLkkOgNibjrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762163509; c=relaxed/simple;
	bh=EJC38eDcg8YuReUlyukja+BTyZmSRBBRZUGSphXgMno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cbe4i1EOCDqW7ejkD645UZqm+BF1FZHl+elw8ts9C1Xcmirw634w5rX912BR2esh2V5qV9NB+/zTqJ4Zb9tg/Ebs/8bHObFS95BoCXAZICpBwo036eXqf5QcEi2M/toK4b1rl+1Dm3sxIGpt8mdAsm7MP4r9IgbyDepXrIbuOyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQmzstoX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQmzstoX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42421b1514fso2428996f8f.2
        for <regressions@lists.linux.dev>; Mon, 03 Nov 2025 01:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163506; x=1762768306; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kzABgnbeDb8pzSGXIXK4gzoaq75SDM4C57TYmZw9FyM=;
        b=HQmzstoXHO0/UE3ldmFdBaJEVy1NklSXzSqKiQ5rm3NfdYfSwdrzFSwCqnyCUAwP0G
         igcpB0PstovdlYWamR/OrGRTqXpj4LLYSVjciUPPGozYMTkb5wFjKH2Gc9T5ct4efVDv
         yQ6UL518GL6fzLb29906R8ao2cZPy889AfjIoRn66ZtdXZ5Xxpak8XudxXR/u0LpiG4y
         DfhG91iwQq0CJA8YvYLX+oFEwLhKuAdPlbodwGmoN6Ndr5KfLNiLscLD6PcQQgSbXx5C
         HRgCYyF65ajAn1v7uhsVAVFV9W0p11yJ9Zy8G6gJn5Y8JGbPHGkvH1VopyQa7iSBnTOV
         xtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163506; x=1762768306;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kzABgnbeDb8pzSGXIXK4gzoaq75SDM4C57TYmZw9FyM=;
        b=Qggc5NuGtHcsoewvBqwQ7VfR3gWoB0vmunwU+W1HZmpKUQCoYqyqI7orEKK7TwL6PI
         klILqGEHTvkhcKsVnpnCCM7r1xm2Atz8pedp1pxBWtHBm9jR0SfMxv9YycvDs2Vp7NZ6
         dcml9/30ZPn4YZfkcda0Snj8SPxpw+3EaemN69QGyz1KfEd/LZOjyh1x/GHBHbz02gOf
         YV72PRGPF2rPrlPUfwpUj6x6Frc++a5SY9yoyw9SdtEEYroso3A8SSN8Fd4Kwhipjo99
         FiMPBQpMkd/2cdJpxelVtreIFnk6NdMvdFouD58DFZVwOafYSSrYv736muGMhrVVxbA+
         CN4w==
X-Forwarded-Encrypted: i=1; AJvYcCVYUxNp9t8mj8WnzkaomTv8nBcm7HC2VrkW4UvEveOka7Y2SVH/FhnnKGg1Hch7VeoCPqYTLMTUZprFYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMF7O2SqLZGyOqhI1Q1JmyuydJD4qcCc56Xlipw3MQUZADib5g
	KOW+61s+MUodPtPX5RTfly/WKgAvIzK2VuhLLDgQqA+1MaluvnDgjWIBre+H0Sjso+E=
X-Gm-Gg: ASbGncuciG2hD2J++1zD2k7P9tZ/ztugaddRpYzKg2eFsEncHwBXjLPRAnHMkhH5wb9
	WNXKZ0xnxmP541LOdipSzvB3iYIsy5GO0PeAjR7Eg0asO6qf871hjPYT7na2HJyftH+43MOlSIG
	kzPKOoNYospFePyxxkhFtVYDcmHZSCxUiAA3erS7wyGacjqavI2IE0en2ldwUYWZ2/ShK26RWKG
	5wyU9lh5hCIE+c2Qisp4QG6dOE4PqYwsy4d1yWv3kcGuM0fHJ69ectfXat2ZYTIMHYopKusaURf
	3cYZdBCJ8GHt2jAw3r9bRu99k2CoYYxbvdkLgUICLNfIYMJMpPwbQfzT30g89AIlnFP/cjdHLe8
	XKdO+BrtLGYGYcADSmUHdbS9gr4Sr8vAqFdAI0lzBgqpeP8FXSDVxSRhp9RpEVIehx76AEr72ii
	ufUCnVRecpDT6wJjJEsyXpCdusRvJi6cMhdA==
X-Google-Smtp-Source: AGHT+IHI4ioHp+AFK0pCBgd1+OsciRLs4AaBA2U7IPrzAi+HZrr//ufjuw7eGBXOAXE8rH1S4TMUdw==
X-Received: by 2002:a05:6000:460a:b0:429:c989:ceb9 with SMTP id ffacd0b85a97d-429c989d6f1mr5585823f8f.51.1762163506013;
        Mon, 03 Nov 2025 01:51:46 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1405fffsm19355129f8f.45.2025.11.03.01.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:51:45 -0800 (PST)
Message-ID: <f0cdf43e-2569-4f24-b337-03d8e430c0cf@linaro.org>
Date: Mon, 3 Nov 2025 10:51:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Bjorn Helgaas <helgaas@kernel.org>,
 Linnaea Lavia <linnaea-von-lavia@live.com>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20251031161323.GA1688975@bhelgaas>
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
In-Reply-To: <20251031161323.GA1688975@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bjorn,

On 10/31/25 17:13, Bjorn Helgaas wrote:
> On Fri, Oct 31, 2025 at 08:26:42PM +0800, Linnaea Lavia wrote:
>> On 10/31/2025 4:50 PM, Neil Armstrong wrote:
>>> On 10/31/25 06:34, Linnaea Lavia wrote:
>>>> On 10/30/2025 1:15 AM, Bjorn Helgaas wrote:
>>>>> On Wed, Oct 29, 2025 at 06:50:46PM +0800, Linnaea Lavia wrote:
>>>>>> On 10/29/2025 6:16 AM, Bjorn Helgaas wrote:
>>>>>
>>>>>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>>>>>> index 214ed060ca1b..9cd12924b5cb 100644
>>>>>>> --- a/drivers/pci/quirks.c
>>>>>>> +++ b/drivers/pci/quirks.c
>>>>>>> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>>>>>>>      * disable both L0s and L1 for now to be safe.
>>>>>>>      */
>>>>>>>     DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>>>>>>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);
>>>>>>>     /*
>>>>>>>      * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>>>>>>
>>>>>> I have applied the patch on 6.18-rc3 but it's still trying to enable ASPM for some reasons.
>>>>>
>>>>> Sorry, my fault, I should have made that fixup run earlier, so the
>>>>> patch should be this instead:
>>>>>
>>>>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>>>>> index 214ed060ca1b..4fc04015ca0c 100644
>>>>> --- a/drivers/pci/quirks.c
>>>>> +++ b/drivers/pci/quirks.c
>>>>> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>>>>>     * disable both L0s and L1 for now to be safe.
>>>>>     */
>>>>>    DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>>>>> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, quirk_disable_aspm_l0s_l1);
>>>>
>>>> L1 still got enabled
> 
> Is that based on the output below?
> 
>    [    5.445853] [     T48] pci 0000:00:00.0: Disabling ASPM L0s/L1
>    [    5.560448] [     T48] pci 0000:01:00.0: ASPM: default states L1
> 
> If so, this doesn't necessarily mean L1 was enabled.  It means the
> quirk marked the 00:00.0 Root Port so we shouldn't ever enable L0s or
> L1, and when we enumerated 01:00.0, we set its default ASPM state to
> L1.
> 
> But I don't *think* L1 should actually be enabled unless we can enable
> it for both 00:00.0 and 01:00.0, and the quirk should mean that we
> can't enable it for 00:00.0.
> 
> This muddle of "capable" (per Link Capabilities) vs "disabled" (either
> the Link Control shows disabled, or software said "don't ever use L1")
> is part of what makes aspm.c so confusing.
> 
>>>> The card works just fine. I'm thinking the ASPM issue is
>>>> probably from the glue driver reporting the link to be down when
>>>> it's really just in low power state.
>>>
>>> You're probably right, the meson_pcie_link_up() not only checks
>>> the LTSSM but also the speed, which is probably wrong.
>>>
>>> Can you try removing the test for speed ?
>>>
>>> -                 if (smlh_up && rdlh_up && ltssm_up && speed_okay)
>>> +                 if (smlh_up && rdlh_up && ltssm_up)
>>>
>>> The other drivers just checks the link, and some only the smlh_up
>>> && rdlh_up. So you can also probably drop ltssm_up aswell.
>>
>> I can confirm that removing the check for ltssm_up and speed_okay
>> made ASPM work.
> 
> I don't think meson_pcie_link_up() should have the loop in it, so the
> ltssm_up and speed_okay checks, the loop, the delay, and the timeout
> message should probably all be removed.  That method is supposed to be
> a simple true/false check, and any waiting required should be done in
> dw_pcie_wait_for_link().
> 
> The link was clearly up when we discovered 01:00.0, so the "wait
> linkup timeout" messages from meson_pcie_link_up() after that must be
> from dw_pcie_link_up() being called via the .map_bus() call in
> pci_generic_config_read() or pci_generic_config_write().
> 
> When meson_pcie_link_up() returns false in those config accessors,
> the config accesses will fail (they won't even be attempted), so we'll
> see things like this:
> 
>    pci 0000:01:00.0: BAR 0: error updating (0xfc700004 != 0xffffffff)
> 
> and "Unknown header type 7f" from lspci.
> 
> Can you drop the ASPM quirk patch and instead try the
> meson_pcie_link_up() patch below on top of v6.18-rc3?
> 
>> We still need a solution to the original issue that's preventing the
>> controller from being initialized.
>>
>> My kernel has the following patch applied, but I think it's not
>> suitable for upstream as this changes device tree bindings for PCIe
>> controller on meson.
> 
> I assume the original issue is this:
> 
>    meson-pcie fc000000.pcie: error -EBUSY: can't request region for resource [mem 0xfc000000-0xfc3fffff]
> 
> and you confirmed that it wasn't fixed by a1978b692a39 ("PCI: dwc: Use
> custom pci_ops for root bus DBI vs ECAM config access"), which
> appeared in v6.18-rc3?
> 
> If it's still broken in v6.18-rc3, and the dtsi and
> meson_pcie_get_mems() patch below makes it work, we have more work to
> do, and maybe Krishna has some ideas.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index dcc927a9da80..ca455f634834 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -138,7 +138,7 @@ pcie: pcie@fc000000 {
>>   			reg = <0x0 0xfc000000 0x0 0x400000>,
>>   			      <0x0 0xff648000 0x0 0x2000>,
>>   			      <0x0 0xfc400000 0x0 0x200000>;
>> -			reg-names = "elbi", "cfg", "config";
>> +			reg-names = "dbi", "cfg", "config";
>>   			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>>   			#interrupt-cells = <1>;
>>   			interrupt-map-mask = <0 0 0 0>;
>> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
>> index 787469d1b396..404c4d9e1900 100644
>> --- a/drivers/pci/controller/dwc/pci-meson.c
>> +++ b/drivers/pci/controller/dwc/pci-meson.c
>> @@ -109,10 +109,6 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
>>   {
>>   	struct dw_pcie *pci = &mp->pci;
>> -	pci->dbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
>> -	if (IS_ERR(pci->dbi_base))
>> -		return PTR_ERR(pci->dbi_base);
>> -
>>   	mp->cfg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
>>   	if (IS_ERR(mp->cfg_base))
>>   		return PTR_ERR(mp->cfg_base);
> 
> diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
> index 787469d1b396..13685d89227a 100644
> --- a/drivers/pci/controller/dwc/pci-meson.c
> +++ b/drivers/pci/controller/dwc/pci-meson.c
> @@ -338,40 +338,10 @@ static struct pci_ops meson_pci_ops = {
>   static bool meson_pcie_link_up(struct dw_pcie *pci)
>   {
>   	struct meson_pcie *mp = to_meson_pcie(pci);
> -	struct device *dev = pci->dev;
> -	u32 speed_okay = 0;
> -	u32 cnt = 0;
> -	u32 state12, state17, smlh_up, ltssm_up, rdlh_up;
> +	u32 state12;
>   
> -	do {
> -		state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> -		state17 = meson_cfg_readl(mp, PCIE_CFG_STATUS17);
> -		smlh_up = IS_SMLH_LINK_UP(state12);
> -		rdlh_up = IS_RDLH_LINK_UP(state12);
> -		ltssm_up = IS_LTSSM_UP(state12);
> -
> -		if (PM_CURRENT_STATE(state17) < PCIE_GEN3)
> -			speed_okay = 1;
> -
> -		if (smlh_up)
> -			dev_dbg(dev, "smlh_link_up is on\n");
> -		if (rdlh_up)
> -			dev_dbg(dev, "rdlh_link_up is on\n");
> -		if (ltssm_up)
> -			dev_dbg(dev, "ltssm_up is on\n");
> -		if (speed_okay)
> -			dev_dbg(dev, "speed_okay\n");
> -
> -		if (smlh_up && rdlh_up && ltssm_up && speed_okay)
> -			return true;
> -
> -		cnt++;
> -
> -		udelay(10);
> -	} while (cnt < WAIT_LINKUP_TIMEOUT);
> -
> -	dev_err(dev, "error: wait linkup timeout\n");
> -	return false;
> +	state12 = meson_cfg_readl(mp, PCIE_CFG_STATUS12);
> +	return IS_SMLH_LINK_UP(state12) && IS_RDLH_LINK_UP(state12);
>   }
>   
>   static int meson_pcie_host_init(struct dw_pcie_rp *pp)

This change looks fine, please submit it so I can CI test it.

Thanks,
Neil

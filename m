Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C8EEBA;
	Fri,  6 Mar 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772781175; cv=none; b=ZIOvAiylrhudkoUHPQ09Hw7AdWsjVufX1TAAZ/iXQiqzW/kEHScfFc3UK3cqobWP//e7ZzH23fwylVhRzR5GvEqc/V2eAUzsZu41psaTUOfos6kxcn7c8nBYRv8hbeT1RQGfgXnkU68No7Ox7P8YIFMZ9n3QOac70Vs8E5UKnTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772781175; c=relaxed/simple;
	bh=XT0AA5uqBKfCW2YCMSUndSquZ6L/D2yShFNdlBVDBOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nBiKiiVsxb8i0iEal5QB20o/dKYBQyy0f9xbzC7nSBnHB+VPSmCrQrUevpboTdkDg+abc8JYbauNjt6p8+Su8Dnh3TmcEmKsoiehajQuVU2ZpbG04/UDRrXrqxzoIVqqyLHXVOFLW7ID6UoQSQ9HJljmKPhJqORyG7s1B0cGmRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdAqwqLv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdAqwqLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA69C4CEF7;
	Fri,  6 Mar 2026 07:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772781174;
	bh=XT0AA5uqBKfCW2YCMSUndSquZ6L/D2yShFNdlBVDBOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tdAqwqLvr+LgBLcGS/59UrDUb0xfPQE6x2hXuTyIYBTK9iJ3xlPmHcYwjIe2UliWq
	 pg8qca/NOkP8TF6MgSSIfi8+/uY/Ld4WITcOSC0mp/QcLQ6QyIAOkO0Z5PJIUeoqLF
	 7i7aY65yYrZdCsNHzrJVBizopzC9orZUQpwIYQkv05OyL7pviv5Qs5/u91dfqvpgGx
	 eaYSWZh+B8ffBozsASa5PrJvwgcZsbVpppfls+r2B6HaCNJ6p59H5YFSZ5UPaRK9xm
	 0nIf8ls/GtEwaTX0J4gnxH2wXLn2LPh8i+NiQHkbDG0mMPSufzzf1kL9b/mEHbbpea
	 3B6MUIfkGJ7kQ==
Message-ID: <502e876d-3627-4d9b-a02b-d2a708ae67e8@kernel.org>
Date: Fri, 6 Mar 2026 08:12:48 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
To: Frank Li <Frank.li@nxp.com>
Cc: max.krummenacher@gmx.de, Francesco Dolcini
 <francesco.dolcini@toradex.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810> <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810> <aaBA65_zLu8S6WMS@toolbox>
 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
 <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
 <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
 <aaniGuauaieO3p36@lizhi-Precision-Tower-5810>
 <39ef5c99-ba8e-40c1-bf93-359db7297d55@kernel.org>
 <aaoI7TqtClwSKTLg@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJoF1BKBQkWlnSaAAoJEBuTQ307
 QWKbHukP/3t4tRp/bvDnxJfmNdNVn0gv9ep3L39IntPalBFwRKytqeQkzAju0whYWg+R/rwp
 +r2I1Fzwt7+PTjsnMFlh1AZxGDmP5MFkzVsMnfX1lGiXhYSOMP97XL6R1QSXxaWOpGNCDaUl
 ajorB0lJDcC0q3xAdwzRConxYVhlgmTrRiD8oLlSCD5baEAt5Zw17UTNDnDGmZQKR0fqLpWy
 786Lm5OScb7DjEgcA2PRm17st4UQ1kF0rQHokVaotxRM74PPDB8bCsunlghJl1DRK9s1aSuN
 hL1Pv9VD8b4dFNvCo7b4hfAANPU67W40AaaGZ3UAfmw+1MYyo4QuAZGKzaP2ukbdCD/DYnqi
 tJy88XqWtyb4UQWKNoQqGKzlYXdKsldYqrLHGoMvj1UN9XcRtXHST/IaLn72o7j7/h/Ac5EL
 8lSUVIG4TYn59NyxxAXa07Wi6zjVL1U11fTnFmE29ALYQEXKBI3KUO1A3p4sQWzU7uRmbuxn
 naUmm8RbpMcOfa9JjlXCLmQ5IP7Rr5tYZUCkZz08LIfF8UMXwH7OOEX87Y++EkAB+pzKZNNd
 hwoXulTAgjSy+OiaLtuCys9VdXLZ3Zy314azaCU3BoWgaMV0eAW/+gprWMXQM1lrlzvwlD/k
 whyy9wGf0AEPpLssLVt9VVxNjo6BIkt6d1pMg6mHsUEVzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmgXUF8FCRaWWyoACgkQG5NDfTtBYptO0w//dlXJs5/42hAXKsk+PDg3wyEFb4NpyA1v
 qmx7SfAzk9Hf6lWwU1O6AbqNMbh6PjEwadKUk1m04S7EjdQLsj/MBSgoQtCT3MDmWUUtHZd5
 RYIPnPq3WVB47GtuO6/u375tsxhtf7vt95QSYJwCB+ZUgo4T+FV4hquZ4AsRkbgavtIzQisg
 Dgv76tnEv3YHV8Jn9mi/Bu0FURF+5kpdMfgo1sq6RXNQ//TVf8yFgRtTUdXxW/qHjlYURrm2
 H4kutobVEIxiyu6m05q3e9eZB/TaMMNVORx+1kM3j7f0rwtEYUFzY1ygQfpcMDPl7pRYoJjB
 dSsm0ZuzDaCwaxg2t8hqQJBzJCezTOIkjHUsWAK+tEbU4Z4SnNpCyM3fBqsgYdJxjyC/tWVT
 AQ18NRLtPw7tK1rdcwCl0GFQHwSwk5pDpz1NH40e6lU+NcXSeiqkDDRkHlftKPV/dV+lQXiu
 jWt87ecuHlpL3uuQ0ZZNWqHgZoQLXoqC2ZV5KrtKWb/jyiFX/sxSrodALf0zf+tfHv0FZWT2
 zHjUqd0t4njD/UOsuIMOQn4Ig0SdivYPfZukb5cdasKJukG1NOpbW7yRNivaCnfZz6dTawXw
 XRIV/KDsHQiyVxKvN73bThKhONkcX2LWuD928tAR6XMM2G5ovxLe09vuOzzfTWQDsm++9UKF a/A=
In-Reply-To: <aaoI7TqtClwSKTLg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/03/2026 23:51, Frank Li wrote:
> On Thu, Mar 05, 2026 at 09:37:26PM +0100, Krzysztof Kozlowski wrote:
>> On 05/03/2026 21:05, Frank Li wrote:
>>> On Mon, Mar 02, 2026 at 10:49:28AM -0500, Frank Li wrote:
>>>> On Mon, Mar 02, 2026 at 11:53:00AM +0100, Max Krummenacher wrote:
>>>>> for our NAND-based modules, and our CI no longer produces any useful
>>>>> results as a consequence.
>>>>>
>>>>> I strongly believe that, as an immediate first step, the commit
>>>>> that moved the DT NAND chip configuration into its subnode should
>>>>> be reverted.
>>>>
>>>> As my previous said, can do partial revert? Just add back property under
>>>> gpmi and keep nand@0 node.
>>>>
>>>> For example
>>>>
>>>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
>>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
>>>> @@ -260,14 +260,10 @@ fixed-link {
>>>> &gpmi {
>>>>   	pinctrl-names = "default";
>>>>   	pinctrl-0 = <&pinctrl_gpmi_nand>;
>>>> +	nand-on-flash-bbt;
>>>>   	#address-cells = <1>;
>>>>  	#size-cells = <0>;
>>>>   	status = "okay";
>>>>
>>>> Remove "- nand@0" part.  You can use "git add -p" to do that.
>>>
>>> Do you plan rework this patch as what I said?
>>
>> Issue and revert were posted two weeks ago. That's maximum time to
>> handle regression.
> 
> Any docuement said these maxium times, I also want to know other maximum

Just read the regression and bug handling docs in the kernel.

> time, such as
> 	what's max time maintainer need reply? Many patch is not any
> reponse for long time.




Best regards,
Krzysztof

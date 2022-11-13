Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35502F5F
	for <regressions@lists.linux.dev>; Sun, 13 Nov 2022 20:47:47 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 445B184D45;
	Sun, 13 Nov 2022 21:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1668372465;
	bh=jImBli5LfZ8bX2tRK99P5tRwfOlRR3XM91OxmoOhzxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J+ZilaYV44yF8EIqjrgAoBr16E3xWWNfKoMMImiobLwnePpZm5HUdjCTubpo36wGM
	 M+lJcGwylZ6Ia9DKImJ+6SONQqD3t9QkCTnXYi4up4MwOSYNZYOaBI50CX4tiD1vWz
	 dron32NRQ5lXbabPKQLZ28Y3gckltDjdsWNs5DK1vW+PAemeG0EJNuAz4wzap/8Q52
	 9dr3pd4UGIImv93r050Bj6Wxs+1j4YoZbJfq7d3pyqoEXaMUJKF8ST88a/Sd2KOvFQ
	 GqUVH5kfD9SqKJyLX3uv44bC5YHKvkl5TPQRUQOufGJeHkuluhP3W8YB3gp4Cmugum
	 RfGhhSuMjbXpQ==
Message-ID: <d5584c93-08e4-d468-e78c-a43edc9e271a@denx.de>
Date: Sun, 13 Nov 2022 21:47:44 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] extcon: usbc-tusb320: Add USB TYPE-C support
Content-Language: en-US
To: Peter Rosin <peda@axentia.se>, linux-usb@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <ALSI@bang-olufsen.dk>,
 regressions@lists.linux.dev
References: <fd0f2d56-495e-6fdd-d1e8-ff40b558101e@axentia.se>
 <576b2fe7-4753-73c3-f2f1-0387da175ad9@denx.de>
 <db6f1bb6-d681-345f-f0fa-c652c44c8e52@axentia.se>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <db6f1bb6-d681-345f-f0fa-c652c44c8e52@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean

On 11/13/22 20:41, Peter Rosin wrote:
> Hi!

Hi,

> 2022-11-13 at 19:48, Marek Vasut wrote:
>> On 11/13/22 17:59, Peter Rosin wrote:
>>> On Sat, Jul 30, 2022 at 08:05:00PM +0200, Marek Vasut wrote:
>>>> The TI TUSB320 seems like a better fit for USB TYPE-C subsystem,
>>>> which can expose details collected by the TUSB320 in a far more
>>>> precise way than extcon. Since there are existing users in the
>>>> kernel and in DT which depend on the extcon interface, keep it
>>>> for now.
>>>>
>>>> Add TYPE-C interface and expose the supported supply current,
>>>> direction and connector polarity via the TYPE-C interface.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> Hi!
>>>
>>> I'm very sad to report that this patch has caused a severe
>>> regression for our devices. They can no longer be powered by simply
>>> sticking a USB cable into their USB ports (they keep resetting
>>> when the tusb320 driver probes), and they reset (and keep resetting)
>>> if a USB cable is connected while the device is powered by other
>>> means.
>>>
>>> We have no connector node nor any typec-power-opmode property
>>> in the device tree, so the mere touching of the new registers
>>> happening in this patch is enough to cause the resets.
>>>
>>> The devices were fine before this patch, and reverting on top
>>> of a recent linus master (4bbf3422df78, from 11/11) makes the
>>> problem go away.
>>>
>>> Any suggestions?
>>
>> Can you test:
>>
>> 341fd15e2e18c ("extcon: usbc-tusb320: Call the Type-C IRQ handler only if a port is registered")
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-linus&id=341fd15e2e18c24d5c738496cfc3d7a272241201
>>
>> ?
> 
> Yup, that solves it. Thanks!

You're welcome.

Since it has a Fixes: tag, it will land in stable releases shortly too I 
think.

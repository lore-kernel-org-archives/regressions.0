Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533072F33
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 19:20:20 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pv0yW-0003lU-7v; Fri, 05 May 2023 21:20:16 +0200
Message-ID: <57dbce31-daa9-9674-513e-f123b94950da@leemhuis.info>
Date: Fri, 5 May 2023 21:20:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Content-Language: en-US, de-DE
To: Jakub Kicinski <kuba@kernel.org>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
Cc: Hayes Wang <hayeswang@realtek.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Stanislav Fomichev <sdf@fomichev.me>
References: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info>
 <87lei36q27.fsf@miraculix.mork.no> <20230505120436.6ff8cfca@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230505120436.6ff8cfca@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683314420;e2903d08;
X-HE-SMSGID: 1pv0yW-0003lU-7v

On 05.05.23 21:04, Jakub Kicinski wrote:
> On Fri, 05 May 2023 12:16:48 +0200 Bjørn Mork wrote:
>> "Linux regression tracking (Thorsten Leemhuis)"
>> <regressions@leemhuis.info> writes:
>>
>>>> Kernel OOPS on boot
>>>>
>>>> Hello,
>>>>
>>>> on my laptop with kernel 6.3.0 and 6.3.1 fails to correctly boot if the usb-c device "RTL8153 Gigabit Ethernet Adapter" is connected.
>>>>
>>>> If I unplug it, boot and the plug it in, everything works fine.
>>>>
>>>> This used to work fine with 6.2.10.
>>>>
>>>> HW:
>>>> - Dell Inc. Latitude 7410/0M5G57, BIOS 1.22.0 03/20/2023
>>>> - Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>>>>
>>>>
>>>> Call Trace (manually typed from the image, typos maybe be included)
>>>> - bpf_dev_bound_netdev_unregister
>>>> - unregister_netdevice_many_notify
>>>> - unregister_netdevice_gueue
>>>> - unregister_netdev
>>>> - usbnet_disconnect
>>>> - usb_unbind_interface
>>>> - device_release_driver_internal
>>>> - bus_remove_device
>>>> - device_del
>>>> - ? kobject_put
>>>> - usb_disable_device
>>>> - usb_set_configuration
>>>> - rt18152_cfgselector_probe
>>>> - usb_probe_device
>>>> - really_probe
>>>> - ? driver_probe_device
>>>> - ...  
>>
>>
>> Ouch. This is obviously related to the change I made to the RTL8153
>> driver, which you can see is in effect by the call to
>> rtl8152_cfgselector_probe above (compensating for the typo).
>>
>> But to me it doesn't look like the bug is in that driver. It seems we
>> are triggering some latent bug in the unregister_netdev code?
>>
>> The trace looks precise enogh to me.  The image also shows
>>
>>  RIP: 0010: __rhastable_lookup.constprop.0+0x18/0x120
>>
>> which I believe comes from bpf_dev_bound_netdev_unregister() calling the
>> bpf_offload_find_netdev(), which does:
>>
>>
>> bpf_offload_find_netdev(struct net_device *netdev)
>> {
>>         lockdep_assert_held(&bpf_devs_lock);
>>
>>         return rhashtable_lookup_fast(&offdevs, &netdev, offdevs_params);
>> }
>>
>>
>> Maybe someone familiar with that code can explain why this fails if called
>> at boot instead of later?
>>
>> AFAICS, we don't do anything out of the ordinary in that driver, with
>> respect to netdev registration at least.  A similar device disconnet and
>> netdev unregister would also happen if you decided to pull the USB
>> device from the port during boot.  In fact, most USB network devices
>> behave similar when disconnected and there is nothing preventing it
>> from happening while the system is booting..
> 
> Yeah, I think it's because late_initcall is too conservative. 
> The device gets removed before late_initcall(). 
> 
> It's just a hashtable init, I think that we can do:
> 
> diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
> index d9c9f45e3529..8a26cd8814c1 100644
> --- a/kernel/bpf/offload.c
> +++ b/kernel/bpf/offload.c
> @@ -859,4 +859,4 @@ static int __init bpf_offload_init(void)
>  	return rhashtable_init(&offdevs, &offdevs_params);
>  }
>  
> -late_initcall(bpf_offload_init);
> +core_initcall(bpf_offload_init);
> 
> 
> Thorsten, how is the communication supposed to work in this case?
> Can you ask the reporter to test this?

I'd prefer to not become the man-in-the middle, that just delays things
and is fragile; but I can do that occasionally if developers really are
unwilling to go to bugzilla.

Bugbot afaics will solve this, but using it right now would require me
to do something some maintainers don't like. See this sub-thread:

https://lore.kernel.org/all/1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info/


:-/

This got me thinking: we could tell bugbot to start monitoring this
thread and then tell the reporter to CC to the new bug bugbot created.
Ugly, but might work.

> I don't see them on CC...

Yeah, as stated in the initial mail of this thread: I sadly can't CC
them, because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"... #sigh

I wish things were different, I'm unhappy about this situation myself.

Ciao, Thorsten

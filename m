Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB31156C2
	for <regressions@lists.linux.dev>; Fri,  5 May 2023 10:32:31 +0000 (UTC)
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 345AH0uC2095047
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 5 May 2023 11:17:01 +0100
Received: from miraculix.mork.no ([IPv6:2a01:799:964:4b0a:9af7:269:d286:bcf0])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 345AHCFv1477488
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 5 May 2023 12:17:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1683281833; bh=VtMIZpdWdmWVYd7T5enY8/LSlmShBp7fCznNG38C/nE=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=T7XD1fQGkQ1lhS1e2ZAfg+aSvHUAEk9gfUHTJ20p+rEeuXth3JRplpenQHPL1jgkh
	 zDzahbL8LXNR7RpdO5sf6AnSqTg8YOFFUvxbzaWcJBt8SqQ0/WgEHVWwkey6gHEv9j
	 nWukj2niFptWBPD2CRk6cAiqqG2mw1UIMq9R2m4w=
Received: (nullmailer pid 1989756 invoked by uid 1000);
	Fri, 05 May 2023 10:16:48 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Hayes Wang <hayeswang@realtek.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [regression] Kernel OOPS on boot with Kernel 6.3(.1) and
 RTL8153 Gigabit Ethernet Adapter
Organization: m
References: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info>
Date: Fri, 05 May 2023 12:16:48 +0200
In-Reply-To: <ec4be122-e213-ca5b-f5d6-e8f9c3fd3bee@leemhuis.info> (Linux
	regression tracking's message of "Fri, 5 May 2023 11:39:33 +0200")
Message-ID: <87lei36q27.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.8 at canardo
X-Virus-Status: Clean

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

>> Kernel OOPS on boot
>>=20
>> Hello,
>>=20
>> on my laptop with kernel 6.3.0 and 6.3.1 fails to correctly boot if the =
usb-c device "RTL8153 Gigabit Ethernet Adapter" is connected.
>>=20
>> If I unplug it, boot and the plug it in, everything works fine.
>>=20
>> This used to work fine with 6.2.10.
>>=20
>> HW:
>> - Dell Inc. Latitude 7410/0M5G57, BIOS 1.22.0 03/20/2023
>> - Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>>=20
>>=20
>> Call Trace (manually typed from the image, typos maybe be included)
>> - bpf_dev_bound_netdev_unregister
>> - unregister_netdevice_many_notify
>> - unregister_netdevice_gueue
>> - unregister_netdev
>> - usbnet_disconnect
>> - usb_unbind_interface
>> - device_release_driver_internal
>> - bus_remove_device
>> - device_del
>> - ? kobject_put
>> - usb_disable_device
>> - usb_set_configuration
>> - rt18152_cfgselector_probe
>> - usb_probe_device
>> - really_probe
>> - ? driver_probe_device
>> - ...


Ouch. This is obviously related to the change I made to the RTL8153
driver, which you can see is in effect by the call to
rtl8152_cfgselector_probe above (compensating for the typo).

But to me it doesn't look like the bug is in that driver. It seems we
are triggering some latent bug in the unregister_netdev code?

The trace looks precise enogh to me.  The image also shows

 RIP: 0010: __rhastable_lookup.constprop.0+0x18/0x120

which I believe comes from bpf_dev_bound_netdev_unregister() calling the
bpf_offload_find_netdev(), which does:


bpf_offload_find_netdev(struct net_device *netdev)
{
        lockdep_assert_held(&bpf_devs_lock);

        return rhashtable_lookup_fast(&offdevs, &netdev, offdevs_params);
}


Maybe someone familiar with that code can explain why this fails if called
at boot instead of later?

AFAICS, we don't do anything out of the ordinary in that driver, with
respect to netdev registration at least.  A similar device disconnet and
netdev unregister would also happen if you decided to pull the USB
device from the port during boot.  In fact, most USB network devices
behave similar when disconnected and there is nothing preventing it
from happening while the system is booting..



Bj=C3=B8rn

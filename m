Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD57E4
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3GMQJPr3wLU/UltjLZBO4G3VQB7dUs9gh+yxdJxZDCM=; t=1686092239; x=1686956239; 
	b=GQ9/OFGWVfY7OplOj0d6zV+7GtVJkSH4LSRvtdhiMrQCN2wqc+PjKFrpEuLmHqmp4WATQcdhBbx
	QALdEc9H5x0hPY20RCyzqnPmuFBGDobFQBhC/km268va2CBhv+JrkTn7473M58aCXWfNjKDlAs+XU
	W9mB+87GZMzms6jYU6+0ERkkvTEbJM+3elsr1az5QT9eR9txE9s2//Ie6lxJSyNEgBk9xmYIxXhmy
	Wz3htry0C7XdgG9VmQdcoqVnjX2GOkzf64oIWnyaszGFQIf3452XiidvBM8q43D89h2Y/JkZeqdAO
	3OVqGRoPqrsUqaOodRe+daq9PCgrFXZ9Re6Q==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
	by mail.blnma.de with esmtp (Exim 4.96)
	(envelope-from <malte@starostik.de>)
	id 1q6fbx-000Ead-1z;
	Tue, 06 Jun 2023 22:57:09 +0000
Received: from zen.localnet ([85.183.148.49])
	by mail.blnma.de with ESMTPSA
	id Hn0FDMS5f2SSVQAA399c4A
	(envelope-from <malte@starostik.de>); Tue, 06 Jun 2023 22:57:08 +0000
From: Malte Starostik <malte@starostik.de>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
 linux-input@vger.kernel.org, linux@hexchain.org, stable@vger.kernel.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date: Wed, 07 Jun 2023 00:57:07 +0200
Message-ID: <5980752.YW5z2jdOID@zen>
In-Reply-To: <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com>
References:
 <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Dienstag, 6. Juni 2023, 17:25:13 CEST schrieb Limonciello, Mario:
> On 6/6/2023 3:08 AM, Benjamin Tissoires wrote:
> > On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
> >>> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> >>>> Hello,
> >>>> 
> >>>> chiming in here as I'm experiencing what looks like the exact same
> >>>> issue, also on a Lenovo Z13 notebook, also on Arch:
> >>>> Oops during startup in task udev-worker followed by udev-worker
> >>>> blocking all attempts to suspend or cleanly shutdown/reboot the
> >>>> machine

> > I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors
> > are enabled, clean up") because the stack trace says that there is a bad
> > list_add, which could happen if the object is not correctly initialized.
> > 
> > However, that commit was present in v6.2, so it might not be that one.
> > 
> If I'm not mistaken the Z13 doesn't actually have any
> sensors connected to SFH.  So I think the suspicion on
> 7bcfdab3f0c6 and theory this is triggered by HID init makes
> a lot of sense.
> 
> Can you try this patch?
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> index d9b7b01900b5..fa693a5224c6 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
> @@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
> *privdata)
>                          devm_kfree(dev, cl_data->report_descr[i]);
>                  }
>                  dev_warn(dev, "Failed to discover, sensors not enabled
> is %d\n", cl_data->is_any_sensor_enabled);
> +               cl_data->num_hid_devices = 0;
>                  return -EOPNOTSUPP;
>          }
>          schedule_delayed_work(&cl_data->work_buffer,
> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));

I applied this to 9e87b63ed37e202c77aa17d4112da6ae0c7c097c now, which was the 
origin when I started the whole bisection. Clean rebuild, issue still 
persists.

Out of 50 boots, I got:

25 clean
22 Oops as posted by the OP
1 same Oops, followed by a panic
1 lockup [1]
1 hanging with just a blank screen

Not sure whether the lockups are related, but [1] mentions modprobe and udev-
worker as well and all problems including the blank screen one appear roughly 
at the same time during boot. As this is before a graphics mode switch, I 
suspect the last mentioned case may be like [1] while the screen was blanked.
To support the timing correlation: the UVC error for the IR cam shown in the 
photo (normal boot noise) also appears right before the BUG in the non-lockup 
bad case.

I do see the dev_warn in dmesg, so the code path modified in your patch is 
indeed hit:
[   10.897521] pcie_mp2_amd 0000:63:00.7: Failed to discover, sensors not 
enabled is 1
[   10.897533] pcie_mp2_amd: probe of 0000:63:00.7 failed with error -95

BR Malte

[1] https://photos.app.goo.gl/2FAvQ7DqBsHEF6Bd8



Received: from abi149hd127.arn1.oracleemaildelivery.com (abi149hd127.arn1.oracleemaildelivery.com [129.149.84.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17D18AE1
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=wJbRNyHi8yoNQasim14sSnWXoA8mCY7kOtEKklhD9LI=;
 b=ALcv05k++y44xeffdk0vwwr4NJDRAm33D0wA93M2I4QUaWQw4IzW2T0FKWvYT3UC+VhuI4CLqWZr
   KuEFHQ4PyDaLSSGWQ9aIPg+2lMDz0EnAJzMYAoDfr0MP5SclJkfbXSpJCFJbDaZB2uYgwmgeAEZm
   lxdJcVWkPZyF1oAeQxqzYA6jxoqQODjKD1ONYK9CbpTpovARSlxcR8cBEAY+J/nxPkUODvwgEjz5
   oNbW5yWxOJWRxasW/kSQVyDLZy4lKMwiAmo6tVPNT9TLgd1Qj+FCJhBE77+A8mJTMoK+KbQ5q9Vc
   9VvRtsII3sEe1ARJikRih3h1Kxk1FwEIq8Cdhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=wJbRNyHi8yoNQasim14sSnWXoA8mCY7kOtEKklhD9LI=;
 b=N2gBetHlAq0OqxQQCFmtN/Wvw3AbVpd9totApijuZcCblmppefqRzehXgWWMNZ2Kh0YIZ7jD+6MT
   jY3JQ/X9QobD0hiROTPXSr/mOne0Oj3aqFmhzQCbhyI7Ojzv4DVCh79szptimVh2rv/sgFIsrXI4
   0QE9Rki/wDvawFUIqBkpb4rVLqGVwjosYSQxLxoFaJHwzoruCk2AbLO592+0g/6jQOzRpLF3mwdq
   As4cv2RvHl0DZJOVdENVv5BIv6hdHZYhG96PMAToPc1B+9laoCijS7bRRnl1LbaO+Sx64d8r/05g
   6YFm4PbWqFykqf2p13DC4IDi8NjZHOJ9XU0lpQ==
Received: by omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230707 64bit (built Jul  7
 2023))
 with ESMTPS id <0RZ4004QBSDHNXD0@omta-ad1-fd2-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Wed, 09 Aug 2023 15:58:29 +0000 (GMT)
Message-id: <6a6fa2ba-c07d-45b2-96c5-b0f44f5f288b@augustwikerfors.se>
Date: Wed, 9 Aug 2023 17:58:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings for
 IRQ1 on AMD Zen
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org
References: <20230809085526.84913-1-hdegoede@redhat.com>
 <20230809085526.84913-4-hdegoede@redhat.com>
Content-language: en-US
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <20230809085526.84913-4-hdegoede@redhat.com>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAEnYWVjk7Vvuxio3PH4r2Bu30R2r5iymG9J69E5kFnUIZYVKHhD1P6r9DekHpXi
 KOBUp4dsB38XhXFLQyPe7AxmivqcTZlDoZmldei9mRbmHnn1uw/RmSeih52PCJhy
 /s95MyauKp/05ZY4e73KJxNxmwhfeBdvrMXWsdkYK+mf/am3lHlZtBUw1TugiFEI
 /aIHLaGLyNzAANksByyw4MdbIwFasJ7aZcgFSG17ovKbiQ154EskKCJcgtp8CTp5
 2zh4dVJzoHhTAOLZZlz7W1AVfKZFlKl0HT3iId/n5NqSmVBuvyg13a+hH0v4O3oh
 dErPTuKh/sEI/btEnHCMYygSiceUmmDdTPZHKqdRA8mXIfn7LChGBwQnKCC12iZn
 1jM2/RexRXFQL3PZDK9K6S2mIuV5GXVdHf4ANGa+uf2q3C4gvYYWZsYvx+2AjRH1 xpRB5Q==

On 2023-08-09 10:55, Hans de Goede wrote:
> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
> settings over the MADT settings.
> 
> This causes the keyboard to malfunction on some laptop models
> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
> for IRQ 1.
> 
> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

One of the laptops fixed by a9c4a912b7dc, PCSpecialist Elimina Pro 16 M 
[1], seems to have no INT_SRC_OVR entry for IRQ 1 [2]:

> [    0.084265] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.084266] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)

I'm not sure if it was IRQ 1 that needed to be overridden for that model 
though, so it may work anyway with patch 2 of this series.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=217394#c18
[2] https://bugzilla.kernel.org/attachment.cgi?id=304338

Regards,
August Wikerfors

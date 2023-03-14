Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAA03236
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678789216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5SIYAuIJ8eJfBqmvXOS8vA1Ut6e+nZSJEM2KQfNYfsc=;
	b=NzJ9Plx+9K92h/hx8tV8RbN9jIDJrRkY6EhgM6dct//oNGyqd8e1/JWfFsTFY7BMixLnu2
	YUWKJ6RTQF/Tf3Kq8Zyz6yKv27/KfSGcUY3+7rk6LSCWqG96A8rjcqfjgKHUclAV37I7jq
	1XSsRVv+y1p6hJtMyE+6NBSmKEkcQGM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-x-lvq-HDNi-meAoDBZIAfA-1; Tue, 14 Mar 2023 06:20:14 -0400
X-MC-Unique: x-lvq-HDNi-meAoDBZIAfA-1
Received: by mail-ed1-f71.google.com with SMTP id i42-20020a0564020f2a00b004fd23c238beso5254472eda.0
        for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 03:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678789213;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5SIYAuIJ8eJfBqmvXOS8vA1Ut6e+nZSJEM2KQfNYfsc=;
        b=YMHoPTo9O1Gi2XjqsHglO20tAHUQoIk0e3Z3CecEpvbbfgwEcY1DP1Ptl1lN5U7wuS
         vQ1CEPyc0MZcHRSwhhC3Wc8MZaRc/G9KgtLz+qVfTB69i9xlzZ2x/qfj6V3V9GiqLBH0
         dNyZUgt9wXN85S8z2m4KkT0ivypKdhmIKouT3hRhyrJP4yOhLpDWqD3M/b//kncvtI5m
         WUpKUzGyeHCRm+l2JkqCvuHZzmw8w+3i1OTpO1G4AncU2N/f3MY2Fyk6EIHE31l4oCOk
         hYNPclLGjrsSXqPG7NvgvWVHei6c/RZrsb/mi7eJbOdFtuUC3ANXg/wU/aYkLNBJSUqo
         lg2w==
X-Gm-Message-State: AO0yUKVJB8zGoMtpSvJ6CL4d+/kmE9NZFbvdmYWGdernCri1XExNnPO2
	yq9arxc6hxwvfNuT3Xu4Li3C6QuzF9JCntdEXbnRPSNKzncAUmLOk3Q4kLrCX4Yw2cnxZYVdCjG
	bgQzFu9BgZPeD3m532EpQYxo=
X-Received: by 2002:a17:907:8c0f:b0:92d:3b95:4660 with SMTP id ta15-20020a1709078c0f00b0092d3b954660mr1018568ejc.21.1678789213603;
        Tue, 14 Mar 2023 03:20:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set84LejG6O8ADs8ya4z39SJuqI/FGuRMV8KIZXAahA844tpe7NFQMIkj3i9cqeY88kW45q2vIA==
X-Received: by 2002:a17:907:8c0f:b0:92d:3b95:4660 with SMTP id ta15-20020a1709078c0f00b0092d3b954660mr1018549ejc.21.1678789213307;
        Tue, 14 Mar 2023 03:20:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x62-20020a50bac4000000b004fbd365fb33sm794721ede.38.2023.03.14.03.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:20:12 -0700 (PDT)
Message-ID: <7f18e19d-4072-0609-afd0-244b06103b9c@redhat.com>
Date: Tue, 14 Mar 2023 11:20:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Hans de Goede <hdegoede@redhat.com>
Subject: [Regression] "serial: 8250: use THRE & __stop_tx also with DMA"
 breaks DMA rx
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ilpo,

I have spend the last couple of days debugging a problem with Bluetooth
adapters (HCIs) connected over an UART connection on Intel Bay Trail
and Cherry Trail devices.

After much debugging I found out that sometimes the first byte of
a received packet (data[0]) would be overwritten with a 0 byte.

E.g. this packet received during init of a BCM4324B3 (1) Bluetooth HCI:

04 0e 0a 01 79 fc 00 54 fe ff ff 00 00

would sometimes turn into:

00 0e 0a 01 79 fc 00 54 fe ff ff 00 00

Further investigation revealed that this goes away if I stop
the dw_dmac module from loading, leading to:
"dw-apb-uart 80860F0A:00: failed to request DMA"
and the UART working without DMA support.

Testing various kernels showed that this problem was introduced
in v5.19, v5.18 - v5.18.19 are fine. An a git bisect points to:

e8ffbb71f783 ("serial: 8250: use THRE & __stop_tx also with DMA")

And reverting that on top of v6.3-rc2 indeed solves the problem.

So it seems that that commit somehow interferes with DMA based
data receiving, causing the first byte of a received data transfer
to get replaced by 0.

The issue has been seen on and the revert has been tested on
the following HW:

Asus T100TA
SoC: Bay Trail UART: 80860F0A WIFI: brcmfmac43241b4-sdio BT: BCM4324B3

Lenovo Yoga Tablet 2 1051L
SoC: Bay Trail UART: 80860F0A WIFI: brcmfmac43241b4-sdio BT: BCM4324B3

Lenovo Yoga Book X91F
Soc: Cherry Trail UART: 8086228A WIFI: brcmfmac4356-pcie BT: BCM4356A2

I have more hw which I believe is affected but these are the models
where I have done detailed testing.

I would be happy to test any patches, or run a kernel with some extra
debugging added, just let me know what you need to help fixing this.

Regards,

Hans


p.s.

I believe that these changes were made to improve the timing of
disabling the transmitter on tx completion when the UART is used
for a RS485 bus. So one option to workaround this might be to only
enable the new behavior when RS485 mode is used ?



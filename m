Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536E428F1
	for <regressions@lists.linux.dev>; Wed, 10 Aug 2022 14:06:18 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id 17so14310457plj.10
        for <regressions@lists.linux.dev>; Wed, 10 Aug 2022 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc;
        bh=UBYU1kWWO5JShEdSdGq0yMGTNDTq36UYslphzmafG8s=;
        b=Wlg08SgTx0wDhTB7jgmjbuq/9ta+oM7GzobRnjxXnWsNDdfnCkQ7Qbewz5gys9rdUP
         Qa8hHLPPLCOuhJuTQXdT2rGQe5C7xPZp1byfTP4N8fjUQDzNs1I5NtKU3Wbdpy7KKWiW
         pksa4e8MrejYoUimk/rMzGNfXALmxiBXBSXJw9T/wVcubszVPUTq+J8eAwrCUIaxNY8O
         xAaeWRQpwt+OtFTpFlnBN0I4y0tC0od5UNni5t2snLVhOC8W5n1sM0N9WeZk/4R/Mzwe
         bgYhh/JEOZi/B98Lrx/ur1sU050CKTfpw5F9HgOztPa8m4zN2wgrCrtSkk7vfLR7biJD
         D3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=UBYU1kWWO5JShEdSdGq0yMGTNDTq36UYslphzmafG8s=;
        b=iDpJIwFCODqyjqMq4eqsYI+BpBns2AY8Lcl5U9Of+FjrSzimDC3EJgJNBO7/LwpHyi
         gm1RO3IaqdS3NXzo64gWtnbGvRbk5XjrhjK1cZXV5zrot3IvKvhRj7QDHydCfEy9Rz4x
         8pFP8aMYipmgVQWudso/epWx6h2eZY88LsbKo6h/WTzGiJM522QIs8eoeyzrSOuGCHm9
         VoWoD34mCQ5iagUCmRliMzvR4UwoHE+xn3XNpVCWU3mzSBWEUWrWyfeYqbbFpo82TpM2
         +9XNeHWrHmAALbEwVeDuFHyCEs4Cy4jKvyq03p8SbdjSBZmS28FUw++C3Q/s9rWlP+IL
         uZHA==
X-Gm-Message-State: ACgBeo1lAfPtJ2nSeD0D6p65CjS0Jv4K1hMf/W91ek9VnyORCTKByT2y
	lZsx3UJPDr1AO52ul7m4gGde7A==
X-Google-Smtp-Source: AA6agR70y8QZ2gsWb688PhZB222/NbLZNKzQpqlPNAEs8p8Y6kKCKyMBGdjttv8Cal6Esj9JRC+xHw==
X-Received: by 2002:a17:90a:fd06:b0:1f3:29d8:72d8 with SMTP id cv6-20020a17090afd0600b001f329d872d8mr3854290pjb.23.1660140374693;
        Wed, 10 Aug 2022 07:06:14 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090a68cc00b001f50c1f896esm1633944pjj.5.2022.08.10.07.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 07:06:14 -0700 (PDT)
Date: Wed, 10 Aug 2022 07:06:12 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, bhelgaas@google.com,
 gregkh@linuxfoundation.org, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] changes to driver_override parsing broke DPDK
 script
Message-ID: <20220810070612.5860d673@hermes.local>
In-Reply-To: <af880c1a-cedd-181f-9b4d-2f1766312fc0@linaro.org>
References: <20220809192102.GA1331186@bhelgaas>
	<af880c1a-cedd-181f-9b4d-2f1766312fc0@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Aug 2022 08:54:36 +0300
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> >> The script is sending single nul character to remove override
> >> and that no longer works.  
> 
> The sysfs API clearly states:
> "and
>  may be cleared with an empty string (echo > driver_override)."
> Documentation/ABI/testing/sysfs-bus-pci
> 
> Sending other data and expecting the same result is not conforming to
> API. Therefore we have usual example of some undocumented behavior which
> user-space started relying on and instead using API, user-space expect
> that undocumented behavior to be back.
> 
> Yay! I wonder what is the point to even describe the ABI if user-space
> can simply ignore it?
> 
> Best regards,
> Krzysztof

The code that does this in the python script is relatively old.
The writing of null was introduced back in 2017 by:

commit 720b7a058260dfd6ae0fcce956bfe44c18681499
Author: Guduri Prathyusha <gprathyusha@caviumnetworks.com>
Date:   Wed Apr 26 19:22:19 2017 +0530

    usertools: fix device binding with kernel tools
    
    The following sequence of operation gives error in binding devices
    1) Bind a device using dpdk-devbind.py
    2) Unbind the device using kernel tools(/sys/bus/pci/device/driver/unbind)
    3) Bind the device using kernel tools(/sys/bus/pci/driver/new_id and
    /sys/bus/pci/driver/bind)
    
    The bind failure was due to cached driver name in 'driver_override'.
    Fix it by writing 'null' to driver_override just after binding a
    device so that any method of binding/unbinding can be used.
    
    Fixes: 2fc350293570 ("usertools: use optimized driver override scheme to bind")
    
    Reported-by: Lijuan A Tu <lijuanx.a.tu@intel.com>
    Signed-off-by: Guduri Prathyusha <gprathyusha@caviumnetworks.com>

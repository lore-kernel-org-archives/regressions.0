Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E9C3C22
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657720714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jYNhz1NPfsQo/c45frbmBM5LPLy9MyOHYAJRZW65u+E=;
	b=QyvGEDQPjwVzEsx28EkgMrWTAGA/BEuePSe90PfPAvr3z7JppQe5rSonc78dibkD1c5wZ9
	D9QFmZ5M5DVs3prI4uH5jtnOFmcjTmjVc6A9Si54hyKbeec6fBe2qTmWeMLhBZTb2OLoSQ
	EcNlbtnn//wubdvCwUxf/KgwnRZccNg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-3YqxCoMLM0-XZxGV_KAKFA-1; Wed, 13 Jul 2022 09:58:31 -0400
X-MC-Unique: 3YqxCoMLM0-XZxGV_KAKFA-1
Received: by mail-ed1-f69.google.com with SMTP id o13-20020a056402438d00b0043aa846b2d2so8379878edc.8
        for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 06:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to;
        bh=/KaBUzMJAb8ELoURf+aDcmgxflG4+mAlNx4MhWPAnms=;
        b=779bYGNWeJvX3t0E0dovbC4Di/LVMXXS8L9q0APVefT86GYRKhRChZZ29wkn+yiK37
         iqPfbW83q36jKJ8xraAOu3Fs1iV3n0+j1KJ9YWyEedXtpaMUeYhwz+qQ5stWfeLKC3Dw
         Hl3xdYvAYwQIeF5rS7l/eqAxD+372Zk3KpD3hgC0Ehba2CQEqPPqgZL6l8i/jlmR0UCp
         pbW0BmsFdZByu6a1ov9h1cNdjyMWeccXKFD2rDcsvIrBKu//GA1iop8jl39zBK51ZRNL
         t8rF6fQ6W1onVbPcArqGQ8Iyp/YJIoq/SVxRnr6jybAxyTa+eMx+Nn05k6f0tqdr/KGN
         5p0Q==
X-Gm-Message-State: AJIora9vJvIyLepd7jYUQxpgYP0w98o2dbo/emfJgz5OzSD11ZpcMcOj
	gKwiApQgn5Poqdi+BSQrZjjidC2qFgY76fvoNSk2B2Y0a7Yut+DKnyXyn8iWsYVxdcrAA5cxhsk
	eaLdO8PaGHMarrj7a1Oka268=
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr3718844ejc.66.1657720710393;
        Wed, 13 Jul 2022 06:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMuFzYBhnUEpQjzR0GE0q5vpz83dYF6EUDZYybFG7bY9u68mWywkzQ+aLih1ks9mgLlfrtcg==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr3718821ejc.66.1657720710145;
        Wed, 13 Jul 2022 06:58:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id w21-20020a50fa95000000b0043a8f40a038sm7997545edr.93.2022.07.13.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 06:58:29 -0700 (PDT)
Message-ID: <2f32f2f5-2c78-9860-5794-2cfd0a283702@redhat.com>
Date: Wed, 13 Jul 2022 15:58:28 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Regression] ACPI: video: Change how we determine if brightness
 key-presses are handled
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Greening <bgreening@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, rafael@kernel.org,
 linux-acpi@vger.kernel.org
References: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
 <02190bee-2e1b-bea3-b716-a7c7f5aa2ff0@redhat.com>
 <CALF=6jG5gmqqXo5cSFFRWRM96K0rzx3WabNdwAmdZQH=unFG7g@mail.gmail.com>
 <3ddcdb24-cab3-509d-d694-edd4ab85df0a@redhat.com>
In-Reply-To: <3ddcdb24-cab3-509d-d694-edd4ab85df0a@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------LEBEnV2skDghZQRyUOjQNnwZ"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------LEBEnV2skDghZQRyUOjQNnwZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi again,

On 7/13/22 15:29, Hans de Goede wrote:

<snip>

> So I plan to fix this part by adding a quirk to make native the default
> on your machine. Can you do:
> 
> sudo dmidecode > dmidecode.txt
> 
> And email me the generated dmidecode.txt (this will contain serialnumbers
> so you may want to send it off-list) ? Then I can also prepare a patch
> to add a quirk to make native the default on your model.

I have found a DMI decode for your model here:
https://github.com/linuxhw/DMI/

So I've written the quirk patch (attached) based on that.

Please give this a try. With a 5.18.1x kernel with both patches applied,
everything should work without needing to specify anything on the kernel
commandline.

Regards,

Hans
--------------LEBEnV2skDghZQRyUOjQNnwZ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ACPI-video-Use-native-backlight-on-Dell-Inspiron-N40.patch"
Content-Disposition: attachment;
 filename*0="0001-ACPI-video-Use-native-backlight-on-Dell-Inspiron-N40.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxMmIyYWU2Y2JiMzY4NjBmOTk2YTVjYTM4MmJiMWRkYTQzYTRmYjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBXZWQsIDEzIEp1bCAyMDIyIDE1OjUzOjA4ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gQUNQ
STogdmlkZW86IFVzZSBuYXRpdmUgYmFja2xpZ2h0IG9uIERlbGwgSW5zcGlyb24gTjQwMTAKClRo
ZSBEZWxsIEluc3Bpcm9uIE40MDEwIGRvZXMgbm90IGhhdmUgQUNQSSBiYWNrbGlnaHQgY29udHJv
bCwKc28gYWNwaV92aWRlb19nZXRfYmFja2xpZ2h0X3R5cGUoKSdzIGhldXJpc3RpY3MgcmV0dXJu
IHZlbmRvciBhcwp0aGUgdHlwZSB0byB1c2UuCgpCdXQgdGhlIHZlbmRvciBpbnRlcmZhY2UgaXMg
YnJva2VuLCB3aGVyZSBhcyB0aGUgbmF0aXZlIChpbnRlbF9iYWNrbGlnaHQpCndvcmtzIHdlbGws
IGFkZCBhIHF1aXJrIHRvIHVzZSBuYXRpdmUuCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yZWdyZXNzaW9ucy9DQUxGPTZqRWU1RzgrcjFXbzB2dno0R2pOUVFoZGtMVDVwOHVDSG42Wlho
ZzRuc09Xb3dAbWFpbC5nbWFpbC5jb20vClJlcG9ydGVkLWFuZC10ZXN0ZWQtYnk6IEJlbiBHcmVl
bmluZyA8YmdyZWVuaW5nQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8
aGRlZ29lZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2FjcGkvdmlkZW9fZGV0ZWN0LmMgfCA4
ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9hY3BpL3ZpZGVvX2RldGVjdC5jIGIvZHJpdmVycy9hY3BpL3ZpZGVvX2RldGVjdC5j
CmluZGV4IGJlY2MxOThlNGMyMi4uNDA5OTE0MGJiZDVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Fj
cGkvdmlkZW9fZGV0ZWN0LmMKKysrIGIvZHJpdmVycy9hY3BpL3ZpZGVvX2RldGVjdC5jCkBAIC0z
NDcsNiArMzQ3LDE0IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCB2aWRlb19k
ZXRlY3RfZG1pX3RhYmxlW10gPSB7CiAJCURNSV9NQVRDSChETUlfUFJPRFVDVF9OQU1FLCAiTWFj
Qm9va1BybzEyLDEiKSwKIAkJfSwKIAl9LAorCXsKKwkgLmNhbGxiYWNrID0gdmlkZW9fZGV0ZWN0
X2ZvcmNlX25hdGl2ZSwKKwkgLyogRGVsbCBJbnNwaXJvbiBONDAxMCAqLworCSAubWF0Y2hlcyA9
IHsKKwkJRE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiRGVsbCBJbmMuIiksCisJCURNSV9NQVRD
SChETUlfUFJPRFVDVF9OQU1FLCAiSW5zcGlyb24gTjQwMTAiKSwKKwkJfSwKKwl9LAogCXsKIAkg
LmNhbGxiYWNrID0gdmlkZW9fZGV0ZWN0X2ZvcmNlX25hdGl2ZSwKIAkgLyogRGVsbCBWb3N0cm8g
VjEzMSAqLwotLSAKMi4zNi4wCgo=
--------------LEBEnV2skDghZQRyUOjQNnwZ--


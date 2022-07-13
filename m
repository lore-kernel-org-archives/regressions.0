Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DD3C22
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 13:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657720162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9lFyIti/hSJcoxP2Dy0a11rzqcBOiIVH8D9UFvaf0tQ=;
	b=fS3uc19Nea9SOJAfHkKKRkZHg+eo+9p8MRPLZjDGBFfZxW6L4aGI2HM8z15+NKp8BKF381
	cyQjz9jwt2/6W2Mkg5gsoOacbpm5FhR+Tn2JyTAvWTmA9kScv/Q4XK8vt13PCS6SrkitUi
	RwmV0KFnX0vHU2J9172OTUZBOAZDSHw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-K0LbIxTCN_ahsj8TD-7-TQ-1; Wed, 13 Jul 2022 09:49:21 -0400
X-MC-Unique: K0LbIxTCN_ahsj8TD-7-TQ-1
Received: by mail-ed1-f69.google.com with SMTP id m10-20020a056402510a00b0043a93d807ffso8402909edd.12
        for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 06:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to;
        bh=/ftiE6vcoK0AtWUaUskL45BO7278A1ajPsM36ag7x0Y=;
        b=sW8ox6f6+w4NqKTC99KdYtxyZ73sAET3mGalUJCzbAeTkVlY8CJPB6qONu1u4FojQZ
         ciGyA+eZ9DwN4cmrieG3XtpMYtwZ9hN88+947yR532d97xBbfDDJEgEpX5pKW6P/zmDW
         iZrXwiezhvRgpUStxH1v+4UDUI9E8PgCaWepFo9qH9/lBQefjfWEBrQTXoKDYxmndRPQ
         4n5XUzGY+kEs3Alz1j+A96sh4Pe6WIPOuOtntFHAfk2PaMQy8JItOqLJgCysxvtxN5OZ
         FxylcXXVGyKrb9DpB26pEAOvm4BSKzL/N/Xnmff6Vvc5WdDyp1wKUZsAQBbMECg0Y/M7
         5gfA==
X-Gm-Message-State: AJIora+/f5xU6Tl/JUcbg8+4PxPlZ1txfBsFbT1rL6Ay+Zhhez9sl/Wr
	dVIle6sWa2VIYJ5ivDo02XMeAPP4jJU+Fg/QzFE/I9v0WszlxUzM683yvnP7I+FyOZWCKr9bXwM
	nAHJqHHdUBEHBr0WI/1NBBNA=
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id ej1-20020a056402368100b0043a7c29466amr5000136edb.367.1657720160335;
        Wed, 13 Jul 2022 06:49:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhybMB1tiAkd3DOySL1/d9VtRr5lV3sjwDBH9zbcUwhYZDlUOKrzxJyQDQcBP7zJDMvywbrg==
X-Received: by 2002:a05:6402:3681:b0:43a:7c29:466a with SMTP id ej1-20020a056402368100b0043a7c29466amr5000109edb.367.1657720160108;
        Wed, 13 Jul 2022 06:49:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ay26-20020a056402203a00b0043b0951f7b1sm1538003edb.41.2022.07.13.06.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 06:49:19 -0700 (PDT)
Message-ID: <eb760bcd-8817-65ed-471e-60e8d9bdae79@redhat.com>
Date: Wed, 13 Jul 2022 15:49:18 +0200
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
Content-Type: multipart/mixed; boundary="------------dK1ZCpYMJQZBsTspUIPpAYxr"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------dK1ZCpYMJQZBsTspUIPpAYxr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 7/13/22 15:29, Hans de Goede wrote:
> Hi,
> 
> On 7/13/22 15:08, Ben Greening wrote:
>> Hi Hans, thanks for getting back to me.
>>
>> evemu-record shows events for both "Video Bus" and "Dell WMI hotkeys":
>>
>> Video Bus
>> E: 0.000001 0001 00e0 0001 # EV_KEY / KEY_BRIGHTNESSDOWN   1
>> E: 0.000001 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
>> E: 0.000020 0001 00e0 0000 # EV_KEY / KEY_BRIGHTNESSDOWN   0
>> E: 0.000020 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
>>
>> Dell WMI hotkeys
>> E: 0.000001 0004 0004 57349 # EV_MSC / MSC_SCAN             57349
>> E: 0.000001 0001 00e0 0001 # EV_KEY / KEY_BRIGHTNESSDOWN   1
>> E: 0.000001 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
>> E: 0.000020 0001 00e0 0000 # EV_KEY / KEY_BRIGHTNESSDOWN   0
>> E: 0.000020 0000 0000 0000 # ------------ SYN_REPORT (0) ---------- +0ms
>>
>> Adding video.report_key_events=1 with acpi_backlight=video makes
>> things work like you said it would.
>>
>>
>> With acpi_backlight=video just has intel_backlight.
>>
>> Without acpi_backlight=video:
>>     intel_backlight:
>>         max_brightness: 4882
>>         backlight control works with echo
>>         brightness keys make no change to brightness value
>>
>>     dell_backlight:
>>         max_brightness: 15
>>         backlight control doesn't work immediately, but does on reboot
>> to set brightness at POST.
>>         brightness keys change brightness value, but you don't see the
>> change until reboot.	
> 
> Ok, so your system lacks ACPI video backlight control, yet still reports
> brightness keypresses through the ACPI Video Bus. Interesting (weird)...
> 
> I think I believe I know how to fix the regression, 1 patch coming up.

Can you please give the attached patch a try, with
video.report_key_events=1 *removed* from the commandline ?

It would also be interesting if you can start evemu-record on the
Dell WMI Hotkeys device before pressing any of the brightness keys.

There might still be a single duplicate event reported there on
the first press. I don't really see a way around that (without causing
all brightness key presses on some panasonic models to be duplicated),
but I'm curious if it is a problem at all...

Regards,

Hans






--------------dK1ZCpYMJQZBsTspUIPpAYxr
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ACPI-video-Change-how-we-determine-if-brightness-key.patch"
Content-Disposition: attachment;
 filename*0="0001-ACPI-video-Change-how-we-determine-if-brightness-key.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAxMmRhMDUxYmVlYTZkZTNlMmZkNDk1ZmQ4YjgyYWNjZTlkZmIzZWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBXZWQsIDEzIEp1bCAyMDIyIDE1OjMxOjE0ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gQUNQ
STogdmlkZW86IENoYW5nZSBob3cgd2UgZGV0ZXJtaW5lIGlmIGJyaWdodG5lc3MKIGtleS1wcmVz
c2VzIGFyZSBoYW5kbGVkIGFnYWluCgpDb21taXQgM2EwY2Y3YWI4ZGYzICgiQUNQSTogdmlkZW86
IENoYW5nZSBob3cgd2UgZGV0ZXJtaW5lIGlmIGJyaWdodG5lc3MKa2V5LXByZXNzZXMgYXJlIGhh
bmRsZWQiKSBtYWRlIGFjcGlfdmlkZW9faGFuZGxlc19icmlnaHRuZXNzX2tleV9wcmVzc2VzKCkK
cmVwb3J0IGZhbHNlIHdoZW4gbm9uZSBvZiB0aGUgQUNQSSBWaWRlbyBEZXZpY2VzIHN1cHBvcnQg
YmFja2xpZ2h0IGNvbnRyb2wuCgpCdXQgaXQgdHVybnMgb3V0IHRoYXQgYXQgbGVhc3Qgb24gYSBE
ZWxsIEluc3Bpcm9uIG40MDEwIHRoZXJlIGlzIG5vIEFDUEkKYmFja2xpZ2h0IGNvbnRyb2wsIHll
dCBicmlnaHRuZXNzIGhvdGtleXMgYXJlIHN0aWxsIHJlcG9ydGVkIHRocm91Z2gKdGhlIEFDUEkg
VmlkZW8gQnVzOyBhbmQgc2luY2UgYWNwaV92aWRlb19oYW5kbGVzX2JyaWdodG5lc3Nfa2V5X3By
ZXNzZXMoKQpub3cgcmV0dXJucyBmYWxzZSwgYnJpZ2h0bmVzcyBrZXlwcmVzc2VzIGFyZSBub3cg
cmVwb3J0ZWQgdHdpY2UuCgpUbyBmaXggdGhpcyByZW5hbWUgdGhlIGhhc19iYWNrbGlnaHQgZmxh
ZyB0byBtYXlfcmVwb3J0X2JyaWdodG5lc3Nfa2V5cyBhbmQKYWxzbyBzZXQgaXQgdGhlIGZpcnN0
IHRpbWUgYSBicmlnaHRuZXNzIGtleSBwcmVzcyBldmVudCBpcyByZWNlaXZlZC4KCkRlcGVuZGlu
ZyBvbiB0aGUgZGVsaXZlcnkgb2YgdGhlIG90aGVyIEFDUEkgKFdNSSkgZXZlbnQgdnMgdGhlIEFD
UEkgVmlkZW8KQnVzIGV2ZW50IHRoaXMgbWVhbnMgdGhhdCB0aGUgZmlyc3QgYnJpZ2h0bmVzcyBr
ZXkgcHJlc3MgbWlnaHQgc3RpbGwgZ2V0CnJlcG9ydGVkIHR3aWNlLCBidXQgYWxsIGZ1cnRoZXIg
a2V5cHJlc3NlcyB3aWxsIGJlIGZpbHRlcmVkIGFzIGJlZm9yZS4KCk5vdGUgdGhhdCB0aGlzIHJl
bGllcyBvbiBvdGhlciBkcml2ZXJzIHJlcG9ydGluZyBicmlnaHRuZXNzIGtleSBldmVudHMKY2Fs
bGluZyBhY3BpX3ZpZGVvX2hhbmRsZXNfYnJpZ2h0bmVzc19rZXlfcHJlc3NlcygpIHdoZW4gZGVs
aXZlcmluZwp0aGUgZXZlbnRzIChyYXRoZXIgdGhlbiBvbmNlIGR1cmluZyBkcml2ZXIgcHJvYmUp
LiBUaGlzIGlzIGFscmVhZHkKcmVxdWlyZWQgYW5kIGRvY3VtZW50ZWQgaW4gaW5jbHVkZS9hY3Bp
L3ZpZGVvLmg6CgovKgogKiBOb3RlOiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYWNwaV92aWRlb19o
YW5kbGVzX2JyaWdodG5lc3Nfa2V5X3ByZXNzZXMoKQogKiBtYXkgY2hhbmdlIG92ZXIgdGltZSBh
bmQgc2hvdWxkIG5vdCBiZSBjYWNoZWQuCiAqLwoKRml4ZXM6IDNhMGNmN2FiOGRmMyAoIkFDUEk6
IHZpZGVvOiBDaGFuZ2UgaG93IHdlIGRldGVybWluZSBpZiBicmlnaHRuZXNzIGtleS1wcmVzc2Vz
IGFyZSBoYW5kbGVkIikKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcmVncmVzc2lvbnMv
Q0FMRj02akVlNUc4K3IxV28wdnZ6NEdqTlFRaGRrTFQ1cDh1Q0huNlpYaGc0bnNPV293QG1haWwu
Z21haWwuY29tLwpSZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBCZW4gR3JlZW5pbmcgPGJncmVlbmlu
Z0BnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhh
dC5jb20+Ci0tLQogZHJpdmVycy9hY3BpL2FjcGlfdmlkZW8uYyB8IDExICsrKysrKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYWNwaS9hY3BpX3ZpZGVvLmMgYi9kcml2ZXJzL2FjcGkvYWNwaV92aWRlby5j
CmluZGV4IGRjM2MwMzdkNjMxMy4uMWEzNTA1NDNhNmJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Fj
cGkvYWNwaV92aWRlby5jCisrKyBiL2RyaXZlcnMvYWNwaS9hY3BpX3ZpZGVvLmMKQEAgLTc5LDcg
Kzc5LDcgQEAgbW9kdWxlX3BhcmFtKGRldmljZV9pZF9zY2hlbWUsIGJvb2wsIDA0NDQpOwogc3Rh
dGljIGludCBvbmx5X2xjZCA9IC0xOwogbW9kdWxlX3BhcmFtKG9ubHlfbGNkLCBpbnQsIDA0NDQp
OwogCi1zdGF0aWMgYm9vbCBoYXNfYmFja2xpZ2h0Oworc3RhdGljIGJvb2wgbWF5X3JlcG9ydF9i
cmlnaHRuZXNzX2tleXM7CiBzdGF0aWMgaW50IHJlZ2lzdGVyX2NvdW50Owogc3RhdGljIERFRklO
RV9NVVRFWChyZWdpc3Rlcl9jb3VudF9tdXRleCk7CiBzdGF0aWMgREVGSU5FX01VVEVYKHZpZGVv
X2xpc3RfbG9jayk7CkBAIC0xMjMyLDcgKzEyMzIsNyBAQCBhY3BpX3ZpZGVvX2J1c19nZXRfb25l
X2RldmljZShzdHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSwKIAlhY3BpX3ZpZGVvX2RldmljZV9m
aW5kX2NhcChkYXRhKTsKIAogCWlmIChkYXRhLT5jYXAuX0JDTSAmJiBkYXRhLT5jYXAuX0JDTCkK
LQkJaGFzX2JhY2tsaWdodCA9IHRydWU7CisJCW1heV9yZXBvcnRfYnJpZ2h0bmVzc19rZXlzID0g
dHJ1ZTsKIAogCW11dGV4X2xvY2soJnZpZGVvLT5kZXZpY2VfbGlzdF9sb2NrKTsKIAlsaXN0X2Fk
ZF90YWlsKCZkYXRhLT5lbnRyeSwgJnZpZGVvLT52aWRlb19kZXZpY2VfbGlzdCk7CkBAIC0xNzAx
LDYgKzE3MDEsOSBAQCBzdGF0aWMgdm9pZCBhY3BpX3ZpZGVvX2RldmljZV9ub3RpZnkoYWNwaV9o
YW5kbGUgaGFuZGxlLCB1MzIgZXZlbnQsIHZvaWQgKmRhdGEpCiAJCWJyZWFrOwogCX0KIAorCWlm
IChrZXljb2RlKQorCQltYXlfcmVwb3J0X2JyaWdodG5lc3Nfa2V5cyA9IHRydWU7CisKIAlhY3Bp
X25vdGlmaWVyX2NhbGxfY2hhaW4oZGV2aWNlLCBldmVudCwgMCk7CiAKIAlpZiAoa2V5Y29kZSAm
JiAocmVwb3J0X2tleV9ldmVudHMgJiBSRVBPUlRfQlJJR0hUTkVTU19LRVlfRVZFTlRTKSkgewpA
QCAtMjI4MCw3ICsyMjgzLDcgQEAgdm9pZCBhY3BpX3ZpZGVvX3VucmVnaXN0ZXIodm9pZCkKIAkJ
Y2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ2aWRlb19idXNfcmVnaXN0ZXJfYmFja2xpZ2h0X3dv
cmspOwogCQlhY3BpX2J1c191bnJlZ2lzdGVyX2RyaXZlcigmYWNwaV92aWRlb19idXMpOwogCQly
ZWdpc3Rlcl9jb3VudCA9IDA7Ci0JCWhhc19iYWNrbGlnaHQgPSBmYWxzZTsKKwkJbWF5X3JlcG9y
dF9icmlnaHRuZXNzX2tleXMgPSBmYWxzZTsKIAl9CiAJbXV0ZXhfdW5sb2NrKCZyZWdpc3Rlcl9j
b3VudF9tdXRleCk7CiB9CkBAIC0yMjk5LDcgKzIzMDIsNyBAQCBFWFBPUlRfU1lNQk9MKGFjcGlf
dmlkZW9fcmVnaXN0ZXJfYmFja2xpZ2h0KTsKIAogYm9vbCBhY3BpX3ZpZGVvX2hhbmRsZXNfYnJp
Z2h0bmVzc19rZXlfcHJlc3Nlcyh2b2lkKQogewotCXJldHVybiBoYXNfYmFja2xpZ2h0ICYmCisJ
cmV0dXJuIG1heV9yZXBvcnRfYnJpZ2h0bmVzc19rZXlzICYmCiAJICAgICAgIChyZXBvcnRfa2V5
X2V2ZW50cyAmIFJFUE9SVF9CUklHSFRORVNTX0tFWV9FVkVOVFMpOwogfQogRVhQT1JUX1NZTUJP
TChhY3BpX3ZpZGVvX2hhbmRsZXNfYnJpZ2h0bmVzc19rZXlfcHJlc3Nlcyk7Ci0tIAoyLjM2LjAK
Cg==
--------------dK1ZCpYMJQZBsTspUIPpAYxr--

